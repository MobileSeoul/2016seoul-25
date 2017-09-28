package com.customer.fooddamas.fooddamas;

import android.Manifest;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.provider.Browser;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.Menu;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.webkit.GeolocationPermissions;//지오로케이션

public class MainActivity extends AppCompatActivity {
    private static final int REQUEST_FINE_LOCATION = 0;

    private WebView mWebView;
    private final String APP_SCHEME = "iamportkakao://";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        loadPermissions(Manifest.permission.ACCESS_COARSE_LOCATION, REQUEST_FINE_LOCATION);

        setContentView(R.layout.activity_main);



        //튜토리얼
        SharedPreferences preference = getSharedPreferences("a",MODE_PRIVATE);
        //스플래시 추가
        startActivity(new Intent(this, SplashActivity.class));
        int firstviewshow = preference.getInt("First", 0);

        if (firstviewshow != 1) {
            Intent intent = new Intent(MainActivity.this,Tutorial.class);
            startActivity(intent);

        }
        chkGpsService();


        mWebView = (WebView) findViewById(R.id.webView);
        mWebView.setWebViewClient(new KakaoWebViewClient(this));

        WebSettings settings = mWebView.getSettings();

        //http <->https이동간의
        settings.setMixedContentMode(WebSettings.MIXED_CONTENT_COMPATIBILITY_MODE);


        mWebView.getSettings().setJavaScriptEnabled(true);

        mWebView.loadUrl("https://fooddamas.com:41002/FoodDamas_Cus/home");

        mWebView.setWebViewClient(new KakaoWebViewClient(this));
        final Context myApp = this;


        mWebView.getSettings().setGeolocationDatabasePath(myApp.getFilesDir().getPath());//지오로케이션
        mWebView.setWebChromeClient(new WebChromeClient() {//지오로케이션
            public void onGeolocationPermissionsShowPrompt(String origin, GeolocationPermissions.Callback callback) {
                callback.invoke(origin, true, false);
            }
            @Override

            public boolean onJsAlert(WebView view, String url, String message, final android.webkit.JsResult result)

            {

                new AlertDialog.Builder(myApp)

                        .setTitle("AlertDialog")

                        .setMessage(message)

                        .setPositiveButton(android.R.string.ok,

                                new AlertDialog.OnClickListener()

                                {

                                    public void onClick(DialogInterface dialog, int which)

                                    {

                                        result.confirm();

                                    }

                                })

                        .setCancelable(false)

                        .create()

                        .show();



                return true;

            };

        });

        // mWebView.getSettings().setSupportMultipleWindows(true);
       // WebChromeClient testChromeClient = new WebChromeClient();
      //  mWebView.setWebChromeClient(testChromeClient);


    }


    ///gps설정

    private boolean chkGpsService() {

        String gps = android.provider.Settings.Secure.getString(getContentResolver(), android.provider.Settings.Secure.LOCATION_PROVIDERS_ALLOWED);


        if (!(gps.matches(".*gps.*") && gps.matches(".*network.*"))) {

            // GPS OFF 일때 Dialog 표시
            AlertDialog.Builder gsDialog = new AlertDialog.Builder(this);
            gsDialog.setTitle("위치 서비스 설정");
            gsDialog.setMessage("무선 네트워크 사용, GPS 위성 사용을 모두 체크하셔야 정확한 위치 서비스가 가능합니다.\n위치 서비스 기능을 설정하시겠습니까?");
            gsDialog.setPositiveButton("OK", new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    // GPS설정 화면으로 이동
                    Intent intent = new Intent(android.provider.Settings.ACTION_LOCATION_SOURCE_SETTINGS);
                    intent.addCategory(Intent.CATEGORY_DEFAULT);
                    startActivity(intent);
                }
            })
                    .setNegativeButton("NO", new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int which) {
                            return;
                        }
                    }).create().show();
            return false;

        } else {
            return true;
        }
    }
////안드로이드 6.0

    private void loadPermissions(String perm, int requestCode) {
        if (ContextCompat.checkSelfPermission(this, android.Manifest.permission.ACCESS_FINE_LOCATION) ==
                PackageManager.PERMISSION_GRANTED &&
                ContextCompat.checkSelfPermission(this, android.Manifest.permission.ACCESS_COARSE_LOCATION) ==
                        PackageManager.PERMISSION_GRANTED) {
        } else {
            ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.ACCESS_FINE_LOCATION}, 1);
            ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.ACCESS_COARSE_LOCATION}, 2);
        }
    }



    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if ((keyCode == KeyEvent.KEYCODE_BACK) && mWebView.canGoBack()) {
            mWebView.goBack();
            return true;
        }
        return super.onKeyDown(keyCode, event);
    }
    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
    }
    @Override
    protected void onResume() {
        super.onResume();
  /*      mWebView.resumeTimers();
        mWebView.pauseTimers();*/
        Intent intent = getIntent();
        if ( intent != null ) {
            Uri intentData = intent.getData();

            if ( intentData != null ) {
                //카카오페이 인증 후 복귀했을 때 결제 후속조치
                String url = intentData.toString();

                if ( url.startsWith(APP_SCHEME) ) {
                    String path = url.substring(APP_SCHEME.length());
                    if ( "process".equalsIgnoreCase(path) ) {
                        mWebView.loadUrl("javascript:IMP.communicate({result:'process'})");
                    } else {
                        mWebView.loadUrl("javascript:IMP.communicate({result:'cancel'})");
                    }
                }
            }
        }

    }

    /*private class JsWebViewClient extends WebViewClient {
        @Override
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            if (url.startsWith("kakaolink:")) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
                startActivity(intent);
            } else {
                view.loadUrl(url);
            }
            return true;
        }


    }

    private class MyWebViewClient extends WebViewClient {
        public static final String INTENT_PROTOCOL_START = "intent:";
        public static final String INTENT_PROTOCOL_INTENT = "#Intent;";
        public static final String INTENT_PROTOCOL_END = ";end;";
        public static final String GOOGLE_PLAY_STORE_PREFIX = "market://details?id=";

        @Override
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            if (url.startsWith(INTENT_PROTOCOL_START)) {
                final int customUrlStartIndex = INTENT_PROTOCOL_START.length();
                final int customUrlEndIndex = url.indexOf(INTENT_PROTOCOL_INTENT);
                if (customUrlEndIndex < 0) {
                    return false;
                } else {
                    final String customUrl = url.substring(customUrlStartIndex, customUrlEndIndex);
                    try {
                        getBaseContext().startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(customUrl)));
                    } catch (ActivityNotFoundException e) {
                        final int packageStartIndex = customUrlEndIndex + INTENT_PROTOCOL_INTENT.length();
                        final int packageEndIndex = url.indexOf(INTENT_PROTOCOL_END);

                        final String packageName = url.substring(packageStartIndex, packageEndIndex < 0 ? url.length() : packageEndIndex);
                        getBaseContext().startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(GOOGLE_PLAY_STORE_PREFIX + packageName)));
                    }
                    return true;
                }
            } else {
                return false;
            }
        }
    }
*/
}