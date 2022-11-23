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
        view.frame.origin.y = -90
        
    }
    
    @objc func keyboardOriginal(notification:Notification){
        view.frame.origin.y = 0
    }
    
    func alertUser(of errorCode: AuthErrorCode) -> String {
        
        switch errorCode.code {
            
        case .accountExistsWithDifferentCredential:
            return AlertsFirebase.alert1.rawValue
        case .adminRestrictedOperation:
            return AlertsFirebase.alert2.rawValue
        case .appNotAuthorized:
            return AlertsFirebase.alert3.rawValue
        case .appNotVerified:
            return AlertsFirebase.alert4.rawValue
        case .appVerificationUserInteractionFailure:
            return AlertsFirebase.alert5.rawValue
        case .captchaCheckFailed:
            return AlertsFirebase.alert6.rawValue
        case .credentialAlreadyInUse:
            return AlertsFirebase.alert7.rawValue
        case .customTokenMismatch:
            return AlertsFirebase.alert8.rawValue
        case .dynamicLinkNotActivated:
            return AlertsFirebase.alert9.rawValue
        case .emailAlreadyInUse:
            return AlertsFirebase.alert10.rawValue
        case .emailChangeNeedsVerification:
            return AlertsFirebase.alert11.rawValue
        case .expiredActionCode:
            return AlertsFirebase.alert12.rawValue
        case .gameKitNotLinked:
            return AlertsFirebase.alert13.rawValue
        case .internalError:
            return AlertsFirebase.alert14.rawValue
        case .invalidActionCode:
            return AlertsFirebase.alert15.rawValue
        case .invalidAPIKey:
            return AlertsFirebase.alert17.rawValue
        case .invalidAppCredential:
            return AlertsFirebase.alert18.rawValue
        case .invalidClientID:
            return AlertsFirebase.alert19.rawValue
        case .invalidContinueURI:
            return AlertsFirebase.alert20.rawValue
        case .invalidCredential:
            return AlertsFirebase.alert21.rawValue
        case .invalidCustomToken:
            return AlertsFirebase.alert22.rawValue
        case .invalidDynamicLinkDomain:
            return AlertsFirebase.alert23.rawValue
        case .invalidEmail:
            return AlertsFirebase.alert24.rawValue
        case .invalidMessagePayload:
            return AlertsFirebase.alert25.rawValue
        case .invalidMultiFactorSession:
            return AlertsFirebase.alert26.rawValue
        case .invalidPhoneNumber:
            return AlertsFirebase.alert27.rawValue
        case .invalidProviderID:
            return AlertsFirebase.alert28.rawValue
        case .invalidRecipientEmail:
            return AlertsFirebase.alert29.rawValue
        case .invalidSender:
            return AlertsFirebase.alert30.rawValue
        case .invalidUserToken:
            return AlertsFirebase.alert31.rawValue
        case .invalidVerificationCode:
            return AlertsFirebase.alert32.rawValue
        case .invalidVerificationID:
            return AlertsFirebase.alert33.rawValue
        case .keychainError:
            return AlertsFirebase.alert34.rawValue
        case .localPlayerNotAuthenticated:
            return AlertsFirebase.alert35.rawValue
        case .maximumSecondFactorCountExceeded:
            return AlertsFirebase.alert36.rawValue
        case .malformedJWT:
            return AlertsFirebase.alert37.rawValue
        case .missingAndroidPackageName:
            return AlertsFirebase.alert38.rawValue
        case .missingAppCredential:
            return AlertsFirebase.alert39.rawValue
        case .missingAppToken:
            return AlertsFirebase.alert40.rawValue
        case .missingContinueURI:
            return AlertsFirebase.alert41.rawValue
        case .missingClientIdentifier:
            return AlertsFirebase.alert42.rawValue
        case .missingEmail:
            return AlertsFirebase.alert44.rawValue
        case .missingIosBundleID:
            return AlertsFirebase.alert45.rawValue
        case .missingMultiFactorSession:
            return AlertsFirebase.alert46.rawValue
        case .missingOrInvalidNonce:
            return AlertsFirebase.alert47.rawValue
        case .missingPhoneNumber:
            return AlertsFirebase.alert48.rawValue
        case .missingVerificationCode:
            return AlertsFirebase.alert49.rawValue
        case .missingVerificationID:
            return AlertsFirebase.alert50.rawValue
        case .missingMultiFactorInfo:
            return AlertsFirebase.alert51.rawValue
        case .multiFactorInfoNotFound:
            return AlertsFirebase.alert52.rawValue
        case .networkError:
            return AlertsFirebase.alert53.rawValue
        case.noSuchProvider:
            return AlertsFirebase.alert54.rawValue
        case .notificationNotForwarded:
            return AlertsFirebase.alert55.rawValue
        case .nullUser:
            return AlertsFirebase.alert56.rawValue
        case .operationNotAllowed:
            return AlertsFirebase.alert57.rawValue
        case .providerAlreadyLinked:
            return AlertsFirebase.alert58.rawValue
        case .quotaExceeded:
            return AlertsFirebase.alert59.rawValue
        case .rejectedCredential:
            return AlertsFirebase.alert60.rawValue
        case .requiresRecentLogin:
            return AlertsFirebase.alert61.rawValue
        case .secondFactorAlreadyEnrolled:
            return AlertsFirebase.alert62.rawValue
        case .secondFactorRequired:
            return AlertsFirebase.alert63.rawValue
        case .sessionExpired:
            return AlertsFirebase.alert64.rawValue
        case .tooManyRequests:
            return AlertsFirebase.alert65.rawValue
        case .unauthorizedDomain:
            return AlertsFirebase.alert66.rawValue
        case .unsupportedFirstFactor:
            return AlertsFirebase.alert67.rawValue
        case .unverifiedEmail:
            return AlertsFirebase.alert68.rawValue
        case .userDisabled:
            return AlertsFirebase.alert69.rawValue
        case .userMismatch:
            return AlertsFirebase.alert70.rawValue
        case .userNotFound:
            return AlertsFirebase.alert71.rawValue
        case .userTokenExpired:
            return AlertsFirebase.alert72.rawValue
        case .weakPassword:
            return AlertsFirebase.alert73.rawValue
        case .webContextAlreadyPresented:
            return AlertsFirebase.alert74.rawValue
        case .webContextCancelled:
            return AlertsFirebase.alert75.rawValue
        default:
            return AlertsFirebase.alert75.rawValue
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
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
