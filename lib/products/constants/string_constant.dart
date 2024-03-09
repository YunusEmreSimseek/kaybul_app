final class StringConstant {
  const StringConstant._();

  static const String appName = 'KAYBUL';
  static const String appTitle = 'Eşyalarınızı Takip Edin';
  static const String rootUrl = 'www.google.com.tr/maps/place/';

  // Login Page
  static const String loginTitle = 'Eşyalarınızı Takip Edin';
  static const String loginEmail = 'Email';
  static const String loginPassword = 'Şifre';
  static const String loginLogin = 'Giriş Yap';
  static const String loginRegister = 'Kayıt Ol';
  static const String loginDontHaveAnAccount = 'Hesabınız Yok mu?';

  // Register Page
  static const String registerTitle = 'Eşyalarınızı Takip Edin';
  static const String registerEmail = 'Email';
  static const String registerPassword = 'Şifre';
  static const String registerName = 'Ad Soyad';
  static const String registerRegister = 'Kayıt Ol';
  static const String registerLogin = 'Giriş Yap';
  static const String registerAlreadyHaveAnAccount = 'Zaten bir hesabınız var mı?';

  // Home Page
  static const String homeShowLocation = 'Konumu Göster';
  static const String homeAvailableFurnitures = 'Mevcut Eşyalar';
  static const String homeNoFurnitures = 'Henüz Eşyanız Bulunmamaktadır';

  // General Dialogs
  static const String successTitle = 'İşlem Başarılı';
  static const String errorTitle = 'İşlem Başarısız';

  // Add Product Dialog
  static const String addProductTitle = 'Yeni Eşya Ekle';
  static const String addProductName = 'İsim : ';
  static const String addProductApi = 'Api Anahtarı : ';
  static const String addProductImage = 'Fotoğraf : ';
  static const String addProductSubtitle =
      'Not: Api anahtarı kısmına ürünle birlikte size verilen api anahtarını giriniz.';
  static const String addProductSave = 'Kaydet';

  // Edit Product Dialog
  static const String editProductTitle = 'Yeni Eşya İsmini Giriniz';

  // Delete Product Dialog
  static const String deleteProductTitle = 'Bu Eşyayı Silmek İstediğinizden Emin Misiniz ?';

  // Field Types
  static const String fieldEmail = 'Email';
  static const String fieldPassword = 'Şifre';
  static const String fieldConfirmPassword = 'Şifrenizi Doğrulayınız';
  static const String fieldPhone = 'Telefon Numarası';
  static const String fieldName = 'Ad Soyad';

  // Validation Messages
  static const String validationEmail = 'Geçerli bir email adresi giriniz';
  static const String validationPassword = 'Şifre en az 6 karakter olmalıdır';
  static const String validationConfirmPassword = 'Şifreler uyuşmuyor';
  static const String validationName = 'Ad Soyad en az 3 karakter olmalıdır';
  static const String validationPhone = 'Geçerli bir telefon numarası giriniz';
  static const String validationRequired = 'Bu alan boş bırakılamaz';

  // Logger Messages
  static const String loggerStreamIsListening = 'Stream is listening';
  static const String loggerCouldNotFetchLocations = 'Could not fetch locations';
  static const String loggerCouldNotLaunchUrl = 'Could not launch url';

  // Firebase Queries
  static const String queryOwnerId = 'ownerId';
}
