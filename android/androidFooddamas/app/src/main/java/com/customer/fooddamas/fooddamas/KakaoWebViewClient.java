package com.customer.fooddamas.fooddamas;

import java.net.URISyntaxException;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.provider.Browser;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class KakaoWebViewClient extends WebViewClient {
	
	private Activity activity;
	
	public KakaoWebViewClient(Activity activity) {
		this.activity = activity;
	}
	public static final String INTENT_PROTOCOL_START = "intent:";
	public static final String INTENT_PROTOCOL_INTENT = "#Intent;";
	public static final String INTENT_PROTOCOL_END = ";end;";
	public static final String GOOGLE_PLAY_STORE_PREFIX = "market://details?id=";
	@Override
	public boolean shouldOverrideUrlLoading(WebView view, String url) {

        if (!url.startsWith("http://") && !url.startsWith("https://") && !url.startsWith("javascript:")) {
			Intent intent = null;
			
			try {
				intent = Intent.parseUri(url, Intent.URI_INTENT_SCHEME); //IntentURI처리
				Uri uri = Uri.parse(intent.getDataString());
				
				activity.startActivity(new Intent(Intent.ACTION_VIEW, uri));
				return true;
			} catch (URISyntaxException ex) {
				return false;
			} catch (ActivityNotFoundException e) {
				if ( intent == null )	return false;
				
				String packageName = intent.getPackage(); //packageName should be com.kakao.talk
		        if (packageName != null) {
		            activity.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=" + packageName)));
		            return true;
		        }
		        
		        return false;
			}
		}else if(url.startsWith("https://kauth")){
            System.out.println("++=========================================================");
            Intent intent = null;

            try {
                intent = Intent.parseUri(url, Intent.URI_INTENT_SCHEME); //IntentURI처리
                Uri uri = Uri.parse(intent.getDataString());

                activity.startActivity(new Intent(Intent.ACTION_VIEW, uri));
                return true;
            } catch (URISyntaxException ex) {
                return false;
            } catch (ActivityNotFoundException e) {
                if ( intent == null )	return false;

                String packageName = intent.getPackage(); //packageName should be com.kakao.talk
                if (packageName != null) {
                    activity.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=" + packageName)));
                    return true;
                }

                return false;
            }
        }
		
		return false;
	}




}
