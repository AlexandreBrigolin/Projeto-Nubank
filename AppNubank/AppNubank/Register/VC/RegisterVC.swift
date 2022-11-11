//
//  ViewController.swift
//  AppNubank
//
//  Created by Alexandre Brigolin on 07/10/22.
//

import UIKit
import Firebase

enum AlertsFirebase: String {
    case alert1 = "Indica que a vinculação da conta é necessária."
    case alert2 = "Indica que a operação é restrita."
    case alert3 = "Indica que o Aplicativo não está autorizado a usar a Autenticação firebase com a chave de API fornecida."
    case alert4 = "Indica que o aplicativo não pôde ser verificado pelo Firebase durante a autenticação do número de telefone."
    case alert5 = "Indica uma falha geral durante o fluxo de verificação do aplicativo."
    case alert6 = "Indica que o token reCAPTCHA não é válido"
    case alert7 = "Indica uma tentativa de vincular-se a uma credencial que já foi vinculada a uma conta diferente do Firebase"
    case alert8 = "Indica que a conta de serviço e a chave API pertencem a diferentes projetos."
    case alert9 = "Indica que um Firebase Dynamic Link não está ativado."
    case alert10 = "Indica que o e-mail usado para tentar um cadastre-se já está em uso."
    case alert11 = "Indica que o e-mail verifed é necessário para ser alterado."
    case alert12 = "Indica que o código OOB está expirado."
    case alert13 = "Indica que a estrutura gamekit não está vinculada antes de tentar a sinalização do Game Center."
    case alert14 = "Indica que ocorreu um erro interno."
    case alert15 = "Indica que o código OOB é inválido."
    case alert17 = "Indica que uma chave de API inválida foi fornecida na solicitação."
    case alert18 = "Indica que um token de dispositivo APNS inválido foi usado na solicitação verifyClient."
    case alert19 = "Indica que o clientID usado para invocar um fluxo web é inválido."
    case alert20 = "Indica que o domínio especificado no URI continue não é válido."
    case alert21 = "Indica que o token IDP ou requestUri é inválido."
    case alert22 = "Indica um erro de validação com o token personalizado."
    case alert23 = "Indica que o domínio Firebase Dynamic Link usado ou não está configurado ou não está autorizado para o projeto atual."
    case alert24 = "Indica que o e-mail é inválido."
    case alert25 = "Indica que existem parâmetros inválidos na carga durante uma tentativa de 'enviar e-mail de redefinição de senha'."
    case alert26 = "Indica que a sessão de vários fatores é inválida."
    case alert27 = "Indica que um número de telefone inválido foi fornecido em uma chamada para verificarPhoneNumber:conclusão:."
    case alert28 = "Representa o código de erro para quando a id do provedor dado para uma operação web é inválida."
    case alert29 = "Indica que o e-mail do destinatário é inválido."
    case alert30 = "Indica que o e-mail do remetente é inválido durante uma tentativa de enviar e-mail de redefinição de senha."
    case alert31 = "Indica que a credencial de auth salva do usuário é inválida, o usuário precisa fazer login novamente."
    case alert32 = "Indica que um código de verificação inválido foi usado na solicitação de número de telefone de verificação."
    case alert33 = "Indica que um ID de verificação inválido foi usado na solicitação de número de telefone de verificação."
    case alert34 = "Indica que ocorreu um erro ao tentar acessar o chaveiro."
    case alert35 = "Indica que o jogador local não foi autenticado antes de tentar a sinalização do Game Center."
    case alert36 = "Indica que a contagem máxima de segundo fator é excedida."
    case alert37 = "Elevado quando um JWT não analisa corretamente. Pode ser acompanhado por um erro subjacente descrevendo qual etapa do processo de análise JWT falhou."
    case alert38 = "Indica que o nome do pacote do Android está faltando quando o sinalizador do AndroidInstallApp é definido como verdadeiro."
    case alert39 = "Indica que o token do dispositivo APNS está faltando na solicitação do Cliente de verificação."
    case alert40 = "Indica que o token do dispositivo APNs não pôde ser obtido. O aplicativo pode não ter configurado a notificação remota corretamente ou pode falhar em encaminhar o token do dispositivo APNs para o FIRAuth se o swizzling do delegado do aplicativo estiver desativado."
    case alert41 = "Indica que um URI continuado não foi fornecido em uma solicitação ao backend que requer um."
    case alert42 = "Indica um erro para quando o identificador do cliente está faltando."
    case alert43 = "Indica que um endereço de e-mail era esperado, mas um não foi fornecido."
    case alert44 = "Indica que o ID do pacote iOS está faltando quando um ID da App Store do iOS é fornecido."
    case alert45 = "Indica que falta a sessão de vários fatores."
    case alert46 = "Indica que a nonce está faltando ou inválida."
    case alert47 = "Indica que um número de telefone não foi fornecido em uma chamada para verificar o número de telefone: conclusão."
    case alert48 = "Indica que a credencial do telefone auth foi criada com um código de verificação vazio."
    case alert49 = "Indica que a credencial de auth do telefone foi criada com um ID de verificação vazio."
    case alert50 = "Indica que faltam as informações de vários fatores."
    case alert51 = "Indica que as informações de vários fatores não foram encontradas."
    case alert52 = "Indica que ocorreu um erro de rede (como um tempo limite, conexão interrompida ou host inalcançável. Esses tipos de erros são muitas vezes recuperáveis com uma nova tentativa. O campo NSUnderlyingError no dicionário NS Error.user Info conterá o erro encontrado.."
    case alert53 = "Indica uma tentativa de desvincular um provedor que não está vinculado."
    case alert54 = "Indica que a cota de mensagens SMS para um determinado projeto foi excedida."
    case alert55 = "Indica que a credencial é rejeitada porque é malformada ou incompatível."
    case alert56 = "Indica que o usuário se attem para alterar e-mail ou senha mais de 5 minutos após a login."
    case alert57 = "Indica que o segundo fator já está inscrito."
    case alert58 = "Indica que o segundo fator é necessário para a sinalização."
    case alert59 = "Indica que o código SMS expirou."
    case alert60 = "Indica que muitas solicitações foram feitas a um método de servidor."
    case alert61 = "Indica que o domínio especificado na URL de continuação não está na lista branca no console Firebase."
    case alert62 = "Indica que o primeiro fator não é suportado."
    case alert63 = "Indica que o e-mail é necessário para verificação."
    case alert64 = "Indica que a conta do usuário está desativada no servidor."
    case alert65 = "Indica que foi feita uma tentativa de reautenticizar com um usuário que não é o usuário atual."
    case alert66 = "Indica que a conta do usuário não foi encontrada."
    case alert67 = "Indica que o token salvo expirou, por exemplo, o usuário pode ter alterado a senha da conta em outro dispositivo. O usuário precisa fazer login novamente no dispositivo que fez essa solicitação."
    case alert68 = "Indica uma tentativa de definir uma senha que é considerada muito fraca."
    case alert69 = "Indica que foi feita uma tentativa de apresentar um novo contexto web enquanto um já estava sendo apresentado."
    case alert70 = "Indica que a apresentação da URL foi cancelada prematuramente pelo usuário."
    case alert71 = "Indicates that an internal error occurred within a SF Safar iView Controller or WKWebView."
    case alert72 = "Indica que uma solicitação de rede dentro de um SFSafariViewController ou WKWebView Foi falhada."
    case alert73 = "Indica que o usuário tentou entrar com uma senha errada."
    case alert74 = "Indica uma falha geral durante um fluxo de login na web."
    case alert75 = "Ocorreu erro desconhecido"
    

}


class RegisterVC: UIViewController  {
    
    var registerScreen: RegisterScreen?
    var auth: Auth?
    var alert: Alert?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configTableViewProtocols(delegate: self, dataSource: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
        self.configKeyoard()
        self.dismissKeyboard()
    }
    
    func configKeyoard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardSubir(notification:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardOriginal(notification:)), name:UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardSubir(notification:)), name:UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardSubir(notification:Notification){
        
        //        print("O teclado mostrará: \(notification.name.rawValue)")
        
        view.frame.origin.y = -90
        
    }
    
    @objc func keyboardOriginal(notification:Notification){
        
        //        print("O teclado mostrará: \(notification.name.rawValue)")
        
        view.frame.origin.y = 0
    }
    
    func alertUser(of errorCode: AuthErrorCode) -> String {
        
        switch errorCode.code {
            
        case .accountExistsWithDifferentCredential:
            return "0- Indicates account linking is required."
        case .adminRestrictedOperation:
            return "1- Indicates that the operation is admin restricted."
        case .appNotAuthorized:
            return "2- Indicates the App is not authorized to use Firebase Authentication with the provided API Key."
        case .appNotVerified:
            return "3- Indicates that the app could not be verified by Firebase during phone number authentication."
        case .appVerificationUserInteractionFailure:
            return "4- Indicates a general failure during the app verification flow."
        case .captchaCheckFailed:
            return "5- Indicates that the reCAPTCHA token is not valid."
        case .credentialAlreadyInUse:
            return "6- Indicates an attempt to link with a credential that has already been linked with a different Firebase account"
        case .customTokenMismatch:
            return "7- Indicates the service account and the API key belong to different projects."
        case .dynamicLinkNotActivated:
            return "8- Indicates that a Firebase Dynamic Link is not activated."
        case .emailAlreadyInUse:
            return "9- Indicates the email used to attempt a sign up is already in use."
        case .emailChangeNeedsVerification:
            return "10- Indicates that the a verifed email is required to changed to."
        case .expiredActionCode:
            return "11- Indicates the OOB code is expired."
        case .gameKitNotLinked:
            return "12- Indicates that the GameKit framework is not linked prior to attempting Game Center signin."
        case .internalError:
            return "13- Indicates an internal error occurred."
        case .invalidActionCode:
            return "15- Indicates the OOB code is invalid."
        case .invalidAPIKey:
            return "15- Indicates an invalid API key was supplied in the request."
        case .invalidAppCredential:
            return "16- Indicates that an invalid APNS device token was used in the verifyClient request."
        case .invalidClientID:
            return "17- Indicates that the clientID used to invoke a web flow is invalid."
        case .invalidContinueURI:
            return "18- Indicates that the domain specified in the continue URI is not valid."
        case .invalidCredential:
            return "19- Indicates the IDP token or requestUri is invalid."
        case .invalidCustomToken:
            return "20- Indicates a validation error with the custom token."
        case .invalidDynamicLinkDomain:
            return "21- Indicates that the Firebase Dynamic Link domain used is either not configured or is unauthorized for the current project."
        case .invalidEmail:
            return "22- Indicates the email is invalid."
        case .invalidMessagePayload:
            return "23- Indicates that there are invalid parameters in the payload during a 'send password reset email' attempt."
        case .invalidMultiFactorSession:
            return "24- Indicates that the multi factor session is invalid."
        case .invalidPhoneNumber:
            return "25- Indicates that an invalid phone number was provided in a call to verifyPhoneNumber:completion:."
        case .invalidProviderID:
            return "26- Represents the error code for when the given provider id for a web operation is invalid."
        case .invalidRecipientEmail:
            return "27- Indicates that the recipient email is invalid."
        case .invalidSender:
            return "28- Indicates that the sender email is invalid during a “send password reset email” attempt."
        case .invalidUserToken:
            return "29- Indicates user’s saved auth credential is invalid, the user needs to sign in again."
        case .invalidVerificationCode:
            return "30- Indicates that an invalid verification code was used in the verifyPhoneNumber request."
        case .invalidVerificationID:
            return "31- Indicates that an invalid verification ID was used in the verifyPhoneNumber request."
        case .keychainError:
            return "32- Indicates an error occurred while attempting to access the keychain."
        case .localPlayerNotAuthenticated:
            return "33- Indicates that the local player was not authenticated prior to attempting Game Center signin."
        case .maximumSecondFactorCountExceeded:
            return "34- Indicates that the maximum second factor count is exceeded."
        case .malformedJWT:
            return "35- Raised when a JWT fails to parse correctly. May be accompanied by an underlying error describing which step of the JWT parsing process failed."
        case .missingAndroidPackageName:
            return "36- Indicates that the android package name is missing when the androidInstallApp flag is set to true."
        case .missingAppCredential:
            return "37- Indicates that the APNS device token is missing in the verifyClient request."
        case .missingAppToken:
            return "38- Indicates that the APNs device token could not be obtained. The app may not have set up remote notification correctly, or may fail to forward the APNs device token to FIRAuth if app delegate swizzling is disabled."
        case .missingContinueURI:
            return "39- Indicates that a continue URI was not provided in a request to the backend which requires one."
        case .missingClientIdentifier:
            return "40- Indicates an error for when the client identifier is missing."
        case .missingEmail:
            return "41- Indicates that an email address was expected but one was not provided."
        case .missingIosBundleID:
            return "42- Indicates that the iOS bundle ID is missing when a iOS App Store ID is provided."
        case .missingMultiFactorSession:
            return "43- Indicates that the multi factor session is missing."
        case .missingOrInvalidNonce:
            return "44- Indicates that the nonce is missing or invalid."
        case .missingPhoneNumber:
            return "45- Indicates that a phone number was not provided in a call to verifyPhoneNumber:completion."
        case .missingVerificationCode:
            return "46- Indicates that the phone auth credential was created with an empty verification code."
        case .missingVerificationID:
            return "47- Indicates that the phone auth credential was created with an empty verification ID."
        case .missingMultiFactorInfo:
            return "48- Indicates that the multi factor info is missing."
        case .multiFactorInfoNotFound:
            return "49- Indicates that the multi factor info is not found."
        case .networkError:
            return "50- Indicates a network error occurred (such as a timeout, interrupted connection, or unreachable host. These types of errors are often recoverable with a retry. The NSUnderlyingError field in the NSError.userInfo dictionary will contain the error encountered."
        case.noSuchProvider:
            return "51- Indicates an attempt to unlink a provider that is not linked."
        case .notificationNotForwarded:
            return "52- Indicates that the app fails to forward remote notification to FIRAuth."
        case .nullUser:
            return "53- Indicates that a non-null user was expected as an argmument to the operation but a null user was provided."
        case .operationNotAllowed:
            return "54- Indicates the administrator disabled sign in with the specified identity provider."
        case .providerAlreadyLinked:
            return "55- Indicates an attempt to link a provider to which the account is already linked."
        case .quotaExceeded:
            return "56- Indicates that the quota of SMS messages for a given project has been exceeded."
        case .rejectedCredential:
            return "57- Indicates that the credential is rejected because it’s misformed or mismatching."
        case .requiresRecentLogin:
            return "58- Indicates the user has attemped to change email or password more than 5 minutes after signing in."
        case .secondFactorAlreadyEnrolled:
            return "59- Indicates that the second factor is already enrolled."
        case .secondFactorRequired:
            return "60- Indicates that the second factor is required for signin."
        case .sessionExpired:
            return "61- Indicates that the SMS code has expired."
        case .tooManyRequests:
            return "62- Indicates that too many requests were made to a server method."
        case .unauthorizedDomain:
            return "63- Indicates that the domain specified in the continue URL is not whitelisted in the Firebase console."
        case .unsupportedFirstFactor:
            return "64- Indicates that the first factor is not supported."
        case .unverifiedEmail:
            return "65- Indicates that the email is required for verification."
        case .userDisabled:
            return "66- Indicates the user’s account is disabled on the server."
        case .userMismatch:
            return "67- Indicates that an attempt was made to reauthenticate with a user which is not the current user."
        case .userNotFound:
            return "68- Indicates the user account was not found."
        case .userTokenExpired:
            return "69- Indicates the saved token has expired, for example, the user may have changed account password on another device. The user needs to sign in again on the device that made this request."
        case .weakPassword:
            return "70- Indicates an attempt to set a password that is considered too weak."
        case .webContextAlreadyPresented:
            return "71- Indicates that an attempt was made to present a new web context while one was already being presented."
        case .webContextCancelled:
            return "72- Indicates that the URL presentation was cancelled prematurely by the user."
        case .webInternalError:
            return "73- Indicates that an internal error occurred within a SFSafariViewController or WKWebView."
        case .webNetworkRequestFailed:
            return "74- Indicates that a network request within a SFSafariViewController or WKWebView failed."
        case .wrongPassword:
            return "75- Indicates the user attempted sign in with a wrong password."
        case .webSignInUserInteractionFailure:
            return "76- Indicates a general failure during a web sign-in flow."
        default:
            return "77- Unknown error occurred"
        }
    }
    
}

extension RegisterVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 800
    }
}

extension RegisterVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RegisterTableViewCell.identifier, for: indexPath) as? RegisterTableViewCell
        cell?.delegate(delegate: self)
        return cell ?? RegisterTableViewCell()
    }
    
}

extension RegisterVC: RegisterTableViewCellProtocol {
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    
    func actionRegisterButton(user: User) {
        print(#function)
        print(user)
        
        Auth.auth().createUser(withEmail: user.email, password: user.password) { user, error in
            
            if let error = error {
                let err = error as NSError
                self.alert?.getAlert(title: "Atenção", message: self.alertUser(of: AuthErrorCode(_nsError: err)))
            } else {
                //                let vc: LoginVC = LoginVC()
                self.navigationController?.popViewController(animated: true)
                //                self.present(vc, animated: true)
            }
        }
        
    }
}
