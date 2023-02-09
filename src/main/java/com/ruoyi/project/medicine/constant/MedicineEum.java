package com.ruoyi.project.medicine.constant;

/**
 * @Date 2023/2/9 /10:35
 * @Author guohc
 * @Description
 */
public enum MedicineEum {
    ONE(1),TWO(2),THREE(3),FOUR(4),FIVE(5),SIX(6);

    private Integer Num;

    private MedicineEum(Integer Num){
        this.Num = Num;
    }

    private Integer getNum(Integer Num){
        return Num;
    }
}
