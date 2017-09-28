package com.customer.fooddamas.fooddamas;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Toast;


/**
 * Created by Leeek on 2016-10-26.
 */

public class Tutorial extends Activity {
    private ViewPager mPager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.tutorial);

        mPager = (ViewPager) findViewById(R.id.pager);
        mPager.setAdapter(new PagerAdapterClass(getApplicationContext()));

    }

    private View.OnClickListener mCloseButtonClick = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            int infoFirst=1;
            SharedPreferences a = getSharedPreferences("a", MODE_PRIVATE);
            SharedPreferences.Editor editor = a.edit();
            editor.putInt("First", infoFirst);
            editor.commit();
            (Toast.makeText(getApplicationContext(), "다시 뜨지 않습니다. ",
                    Toast.LENGTH_LONG)).show();
            finish();
        }
    };

    /**
     * PagerAdapter
     */
    private class PagerAdapterClass extends PagerAdapter{

        private LayoutInflater mInflater;

        public PagerAdapterClass(Context c){
            super();
            mInflater = LayoutInflater.from(c);
        }

        @Override
        public int getCount() {
            return 4;
        }

        @Override
        public Object instantiateItem(View pager, int position) {
            View v = null;
            if(position==0){
                v = mInflater.inflate(R.layout.tutorial_login, null);
                v.findViewById(R.id.login);
            }
            else if(position==1){
                v = mInflater.inflate(R.layout.tutorial_order, null);
                v.findViewById(R.id.order);
            }else if(position==2){
                v = mInflater.inflate(R.layout.tutorial_orderdetail, null);
                v.findViewById(R.id.orderdetail);
            }else{
                v = mInflater.inflate(R.layout.tutorial_api, null);
                v.findViewById(R.id.api);
                v.findViewById(R.id.close).setOnClickListener(mCloseButtonClick);
            }
            ((ViewPager)pager).addView(v, 0);
            return v;
        }

        @Override
        public void destroyItem(View pager, int position, Object view) {
            ((ViewPager)pager).removeView((View)view);
        }

        @Override
        public boolean isViewFromObject(View pager, Object obj) {
            return pager == obj;
        }

        @Override public void restoreState(Parcelable arg0, ClassLoader arg1) {}
        @Override public Parcelable saveState() { return null; }
        @Override public void startUpdate(View arg0) {}
        @Override public void finishUpdate(View arg0) {}
    }
}
