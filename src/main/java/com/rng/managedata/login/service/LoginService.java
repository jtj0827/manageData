package com.rng.managedata.login.service;

import com.rng.managedata.common.service.CommonService;
import com.rng.managedata.database.jpa.entity.common.AccountEntity;
import com.rng.managedata.database.jpa.entity.common.AllowIpEntity;
import com.rng.managedata.database.jpa.entity.common.IpSettingEntity;
import com.rng.managedata.database.jpa.entity.common.LoginLogEntity;
import com.rng.managedata.database.jpa.repository.common.AccountRepository;
import com.rng.managedata.database.jpa.repository.common.AllowIpRepository;
import com.rng.managedata.database.jpa.repository.common.IpSettingRepository;
import com.rng.managedata.database.jpa.repository.common.LoginLogRepository;
import com.rng.managedata.database.jpa.repository.serverMng.ServerInfoRepository;
import lombok.AllArgsConstructor;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Service
@AllArgsConstructor
public class LoginService extends CommonService {

    private final AccountRepository accountRepository;
    private final HttpSession session;
    private final AllowIpRepository allowIpRepository;
    private final IpSettingRepository ipSettingRepository;
    private final LoginLogRepository loginLogRepository;

    private final ServerInfoRepository serverInfoRepository;

    /**
     * FUNCTION :: 로그인 페이지
     * @return
     */
    public String loginForm(Model model) {
        model.addAttribute("clientIP", getClientIP());
        return "login/form";
    }

    /**
     * FUNCTION :: 로그인 요청
     * @param loginInfo
     * @return
     */
    public String login(AccountEntity loginInfo) {
        Map<String, Object> rtnMap = returnMap();
        AccountEntity account = accountRepository.findByIdAndStep(loginInfo.getId(), "K");

        String clientIP = getClientIP();

        IpSettingEntity ipSetting = ipSettingRepository.findByPartnerIdx(0L);
        if (account != null && ipSetting != null && !ipSetting.getAllowValue()) {   // LINE :: 설정값이 지정 아이피일 경우
           if ("T".equals(account.getDenyIp())) {                                   // LINE :: 로그인 시도 계정이 IP 접근제한 적용일 경우
                Boolean allowed = false;
                List<AllowIpEntity> whitelist = allowIpRepository.findAllByPartnerIdx(0L);
                for (AllowIpEntity entity : whitelist) {
                    if (entity.getIp().equals(clientIP)) {                          // LINE :: 접속 IP가 등록되어있는 IP일 경우 허용
                        allowed = true;
                        break;
                    }
                }
                if (!allowed) {                                                     // LINE :: 접속 IP가 등록되어 있지 않을 경우
                    loginLogRepository.save(setLoginLog(account, loginInfo.getId(), "I"));
                    rtnMap.put(AJAX_RESULT_TEXT, AJAX_RESULT_ILLEGAL_PERMIT);       // LINE :: httpCode 406(허용되지 않음) 리턴
                    return jsonFormatTransfer(rtnMap);
                }
            }
        }

        // LINE :: 계정 존재하지 않는 경우
        if (account == null) {
            loginLogRepository.save(setLoginLog(null, loginInfo.getId(), "N"));
            rtnMap.put(AJAX_RESULT_TEXT, AJAX_RESULT_NODATA);
        } else if (!BCrypt.checkpw(loginInfo.getPassword(), account.getPassword())) {    // LINE :: 비밀번호가 일치하지 않는 경우
            loginLogRepository.save(setLoginLog(loginInfo, loginInfo.getId(), "P"));
            rtnMap.put(AJAX_RESULT_TEXT, AJAX_RESULT_NODATA);
        } else {    // LINE :: 아이디/비밀번호 일치하는 경우
            session.setMaxInactiveInterval(180 * 60);
            session.setAttribute("accountInfo", account);
            loginLogRepository.save(setLoginLog(account, loginInfo.getId(), "S"));
            rtnMap.put(AJAX_RESULT_TEXT, AJAX_RESULT_SUCCESS);
        }

        return jsonFormatTransfer(rtnMap);
    }

    /**
     * FUNCTION :: 로그인 로그 셋팅
     * @param account
     * @param loginCode
     * @return
     */
    public LoginLogEntity setLoginLog(AccountEntity account, String attemptId, String loginCode){
        LoginLogEntity loginAttempt = new LoginLogEntity();
        if(account != null){
            loginAttempt.setAccountIdx(account.getIdx()); // LINE :: 계정 고유값 셋팅
        }else{
            // LINE :: 계정정보가 존재하지 않을시
            loginAttempt.setAccountIdx(0L);               // LINE :: 계정 고유값 0으로 셋팅
        }
        loginAttempt.setAttemptId(attemptId);           // LINE :: 로그인 시도 ID
        loginAttempt.setLoginCode(loginCode);           // LINE :: 로그인 결과 셋팅
        loginAttempt.setIp(getClientIP());              // LINE :: 로그인 시도 IP정보 셋팅
        return loginAttempt;
    }

    /**
     * FUNCTION :: 로그아웃
     * @return
     */
    public String logout() {
        session.invalidate();
        return "redirect:/";
    }
}
