import NFAToolkit
public extension NSObject{
    
    func noCount(_ str : String? , tip : String) -> Bool{
        if str?.count ?? 0 == 0 {
            if tip == "生日" {
                showTipsWindow("出生日期" + "不能为空", delayTime: 2)
            }else{

            }
            return true
        }
        return false
    }

    func showTipsWindow(_ tips : String = "系统错误", delayTime : CGFloat = 2){

        let tipsView =  AppWindow().viewWithTag(999) ?? UIView()
        tipsView.backgroundColor = colorConversion(colorValue: "000000", alpha: 0.8)
        tipsView.tag = 999
        AppWindow().addSubview(tipsView)
        tipsView.alpha = 0

        let label = UILabel()
        label.textAlignment  = .center
        label.text = tips
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.sizeToFit()
        tipsView.addSubview(label)
        tipsView.frame = CGRect(x: 0, y: 0, width: label.width + 20, height: label.height + 20)
        tipsView.center = AppWindow().center
        Tools.setCornerRadius(tipsView, rate: 5)

        UIView.animate(withDuration: 0.3, animations: {
            tipsView.alpha = 1
        }) { (finished) in
            UIView.animate(withDuration: 0.3, delay: TimeInterval(delayTime), options: UIView.AnimationOptions.curveEaseOut, animations: {
                tipsView.alpha = 0
            }, completion: { (b) in
                tipsView.removeFromSuperview()
            })
        }
    }
}
