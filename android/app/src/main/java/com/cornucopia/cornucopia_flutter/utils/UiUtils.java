package com.cornucopia.cornucopia_flutter.utils;

import android.content.Context;


/**
 * Ui相关工具类
 *
 * @author l84116371
 * @version 1.0
 * @since 2019/6/26
 */
public class UiUtils {

    /**
     * dp->px单位转换
     *
     * @param context
     * @param dp
     * @return
     */
    public static int dpToPx(Context context, int dp) {
        float scale = context.getResources().getDisplayMetrics().density;
        return (int) (dp * scale + 0.5f);
    }

    /**
     * px->dp单位转换
     *
     * @param context
     * @param px
     * @return
     */
    public static int pxTodp(Context context, float px) {
        float scale = context.getResources().getDisplayMetrics().density;
        return (int) (px / scale + 0.5f);
    }



}
