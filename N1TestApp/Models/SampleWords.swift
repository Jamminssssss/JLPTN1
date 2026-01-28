import Foundation
import SwiftUI

let words: [Word] = [
    Word(kanji: "明かす",
         reading: "あかす",
         meanings: [
            "ko": "밝히다, 공개하다",
            "en": "To reveal, to disclose",
            "ja": "明かす",
            "zh-Hans": "透露"
         ]),
    Word(kanji: "商う",
         reading: "あきなう",
         meanings: [
            "ko": "거래하다, 장사하다",
            "en": "To trade, to deal in",
            "ja": "商う",
            "zh-Hans": "经商"
         ]),
    Word(kanji: "値する",
         reading: "あたいする",
         meanings: [
            "ko": "가치가 있다, 마땅하다",
            "en": "To be worth, to deserve",
            "ja": "値する",
            "zh-Hans": "值得"
         ]),
    Word(kanji: "歩む",
         reading: "あゆむ",
         meanings: [
            "ko": "걷다, 나아가다",
            "en": "To walk, to go",
            "ja": "歩む",
            "zh-Hans": "行走"
         ]),
    Word(kanji: "言い張る",
         reading: "いいはる",
         meanings: [
            "ko": "주장하다, 고집하다",
            "en": "To insist, to assert",
            "ja": "言い張る",
            "zh-Hans": "坚持"
         ]),
    Word(kanji: "労る",
         reading: "いたわる",
         meanings: [
            "ko": "보살피다, 배려하다",
            "en": "To take care of, to be considerate",
            "ja": "労る",
            "zh-Hans": "照顾"
         ]),
    Word(kanji: "挑む",
         reading: "いどむ",
         meanings: [
            "ko": "도전하다, 맞서다",
            "en": "To challenge, to defy",
            "ja": "挑む",
            "zh-Hans": "挑战"
         ]),
    Word(kanji: "否む",
         reading: "いなむ",
         meanings: [
            "ko": "거부하다, 부정하다",
            "en": "To deny, to refuse",
            "ja": "否む",
            "zh-Hans": "否认"
         ]),
    Word(kanji: "威張る",
         reading: "いばる",
         meanings: [
            "ko": "자랑하다, 뽐내다",
            "en": "To boast, to be proud",
            "ja": "威張る",
            "zh-Hans": "炫耀"
         ]),
    Word(kanji: "戒める",
         reading: "いましめる",
         meanings: [
            "ko": "경계하다, 경고하다",
            "en": "To caution, to warn",
            "ja": "戒める",
            "zh-Hans": "告诫"
         ]),
    Word(kanji: "浮かれる",
         reading: "うかれる",
         meanings: [
            "ko": "기뻐하다, 즐거워하다",
            "en": "To be merry, to be cheerful",
            "ja": "浮かれる",
            "zh-Hans": "高兴"
         ]),
    Word(kanji: "打ち切る",
         reading: "うちきる",
         meanings: [
            "ko": "중단하다, 그만두다",
            "en": "To discontinue, to stop",
            "ja": "打ち切る",
            "zh-Hans": "终止"
         ]),
    Word(kanji: "打ち込む",
         reading: "うちこむ",
         meanings: [
            "ko": "몰두하다, 집중하다",
            "en": "To devote oneself to, to focus on",
            "ja": "打ち込む",
            "zh-Hans": "投入"
         ]),
    Word(kanji: "訴える",
         reading: "うったえる",
         meanings: [
            "ko": "호소하다, 불평하다",
            "en": "To appeal, to complain",
            "ja": "訴える",
            "zh-Hans": "申诉"
         ]),
    Word(kanji: "促す",
         reading: "うながす",
         meanings: [
            "ko": "촉구하다, 재촉하다",
            "en": "To urge, to prompt",
            "ja": "促す",
            "zh-Hans": "催促"
         ]),
    Word(kanji: "敬う",
         reading: "うやまう",
         meanings: [
            "ko": "존경하다, 공경하다",
            "en": "To respect, to honor",
            "ja": "敬う",
            "zh-Hans": "尊敬"
         ]),
    Word(kanji: "恨む",
         reading: "うらむ",
         meanings: [
            "ko": "원망하다, 원한을 품다",
            "en": "To hold a grudge, to resent",
            "ja": "恨む",
            "zh-Hans": "怨恨"
         ]),
    Word(kanji: "潤う",
         reading: "うるおう",
         meanings: [
            "ko": "촉촉해지다, 혜택을 받다",
            "en": "To be moist, to benefit",
            "ja": "潤う",
            "zh-Hans": "滋润"
         ]),
    Word(kanji: "拝む",
         reading: "おがむ",
         meanings: [
            "ko": "기도하다, 예배하다",
            "en": "To worship, to pray",
            "ja": "拝む",
            "zh-Hans": "祈祷"
         ]),
    Word(kanji: "怠る",
         reading: "おこたる",
         meanings: [
            "ko": "게으름피우다, 소홀히 하다",
            "en": "To neglect, to be lazy",
            "ja": "怠る",
            "zh-Hans": "懈怠"
         ]),
    Word(kanji: "襲う",
         reading: "おそう",
         meanings: [
            "ko": "습격하다, 공격하다",
            "en": "To attack, to assault",
            "ja": "襲う",
            "zh-Hans": "袭击"
         ]),
    Word(kanji: "陥る",
         reading: "おちいる",
         meanings: [
            "ko": "빠지다, 함정에 걸리다",
            "en": "To fall into, to sink",
            "ja": "陥る",
            "zh-Hans": "陷入"
         ]),
    Word(kanji: "劣る",
         reading: "おとる",
         meanings: [
            "ko": "뒤떨어지다, 열등하다",
            "en": "To be inferior, to fall behind",
            "ja": "劣る",
            "zh-Hans": "劣于"
         ]),
    Word(kanji: "衰える",
         reading: "おとろえる",
         meanings: [
            "ko": "쇠퇴하다, 약해지다",
            "en": "To decline, to weaken",
            "ja": "衰える",
            "zh-Hans": "衰退"
         ]),
    Word(kanji: "帯びる",
         reading: "おびる",
         meanings: [
            "ko": "가지다, 착용하다",
            "en": "To carry, to wear",
            "ja": "帯びる",
            "zh-Hans": "携带"
         ]),
    Word(kanji: "思い返す",
         reading: "おもいかえす",
         meanings: [
            "ko": "다시 생각하다, 회상하다",
            "en": "To reconsider, to think back",
            "ja": "思い返す",
            "zh-Hans": "回想"
         ]),
    Word(kanji: "思い詰める",
         reading: "おもいつめる",
         meanings: [
            "ko": "지나치게 걱정하다, 골똘히 생각하다",
            "en": "To worry too much, to brood over",
            "ja": "思い詰める",
            "zh-Hans": "苦思"
         ]),
    Word(kanji: "及ぼす",
         reading: "およぼす",
         meanings: [
            "ko": "미치다, 영향을 주다",
            "en": "To exert, to cause",
            "ja": "及ぼす",
            "zh-Hans": "施加"
         ]),
    Word(kanji: "顧みる",
         reading: "かえりみる",
         meanings: [
            "ko": "돌아보다, 반성하다",
            "en": "To look back, to reflect",
            "ja": "顧みる",
            "zh-Hans": "回顾"
         ]),
    Word(kanji: "省みる",
         reading: "かえりみる",
         meanings: [
            "ko": "반성하다, 되돌아보다",
            "en": "To reflect, to reconsider",
            "ja": "省みる",
            "zh-Hans": "反省"
         ]),
    Word(kanji: "掲げる",
         reading: "かかげる",
         meanings: [
            "ko": "들어올리다, 게시하다",
            "en": "To raise, to hoist",
            "ja": "掲げる",
            "zh-Hans": "高举"
         ]),
    Word(kanji: "稼ぐ",
         reading: "かせぐ",
         meanings: [
            "ko": "벌다, 수입을 얻다",
            "en": "To earn, to make money",
            "ja": "稼ぐ",
            "zh-Hans": "赚钱"
         ]),
    Word(kanji: "偏る",
         reading: "かたよる",
         meanings: [
            "ko": "치우치다, 편향되다",
            "en": "To lean, to be biased",
            "ja": "偏る",
            "zh-Hans": "偏颇"
         ]),
    Word(kanji: "絡む",
         reading: "からむ",
         meanings: [
            "ko": "얽히다, 관련되다",
            "en": "To entangle, to involve",
            "ja": "絡む",
            "zh-Hans": "纠缠"
         ]),
    Word(kanji: "築く",
         reading: "きずく",
         meanings: [
            "ko": "건설하다, 구축하다",
            "en": "To build, to construct",
            "ja": "築く",
            "zh-Hans": "建设"
         ]),
    Word(kanji: "切り出す",
         reading: "きりだす",
         meanings: [
            "ko": "화제를 꺼내다, 시작하다",
            "en": "To break the ice, to begin talking",
            "ja": "切り出す",
            "zh-Hans": "提出"
         ]),
    Word(kanji: "食い違う",
         reading: "くいちがう",
         meanings: [
            "ko": "불일치하다, 다르다",
            "en": "To disagree, to differ",
            "ja": "食い違う",
            "zh-Hans": "不一致"
         ]),
    Word(kanji: "食い止める",
         reading: "くいとめる",
         meanings: [
            "ko": "막다, 방지하다",
            "en": "To stop, to prevent",
            "ja": "食い止める",
            "zh-Hans": "阻止"
         ]),
    Word(kanji: "崩す",
         reading: "くずす",
         meanings: [
            "ko": "무너뜨리다, 파괴하다",
            "en": "To destroy, to break",
            "ja": "崩す",
            "zh-Hans": "破坏"
         ]),
    Word(kanji: "覆す",
         reading: "くつがえす",
         meanings: [
            "ko": "뒤집다, 전복시키다",
            "en": "To overturn, to overthrow",
            "ja": "覆す",
            "zh-Hans": "推翻"
         ]),
    Word(kanji: "拘る",
         reading: "こだわる",
         meanings: [
            "ko": "집착하다, 신경쓰다",
            "en": "To be particular about, to fuss over",
            "ja": "拘る",
            "zh-Hans": "拘泥"
         ]),
    Word(kanji: "拒む",
         reading: "こばむ",
         meanings: [
            "ko": "거절하다, 거부하다",
            "en": "To refuse, to reject",
            "ja": "拒む",
            "zh-Hans": "拒绝"
         ]),
    Word(kanji: "遮る",
         reading: "さえぎる",
         meanings: [
            "ko": "가로막다, 방해하다",
            "en": "To interrupt, to block",
            "ja": "遮る",
            "zh-Hans": "遮挡"
         ]),
    Word(kanji: "逆らう",
         reading: "さからう",
         meanings: [
            "ko": "거스르다, 반대하다",
            "en": "To oppose, to resist",
            "ja": "逆らう",
            "zh-Hans": "违背"
         ]),
    Word(kanji: "差し引く",
         reading: "さしひく",
         meanings: [
            "ko": "공제하다, 빼다",
            "en": "To deduct, to subtract",
            "ja": "差し引く",
            "zh-Hans": "扣除"
         ]),
    Word(kanji: "授ける",
         reading: "さずける",
         meanings: [
            "ko": "수여하다, 부여하다",
            "en": "To grant, to award",
            "ja": "授ける",
            "zh-Hans": "授予"
         ]),
    Word(kanji: "察する",
         reading: "さっする",
         meanings: [
            "ko": "추측하다, 감지하다",
            "en": "To guess, to sense",
            "ja": "察する",
            "zh-Hans": "察觉"
         ]),
    Word(kanji: "悟る",
         reading: "さとる",
         meanings: [
            "ko": "깨닫다, 인식하다",
            "en": "To realize, to perceive",
            "ja": "悟る",
            "zh-Hans": "领悟"
         ]),
    Word(kanji: "妨げる",
         reading: "さまたげる",
         meanings: [
            "ko": "방해하다, 저지하다",
            "en": "To hinder, to obstruct",
            "ja": "妨げる",
            "zh-Hans": "妨碍"
         ]),
    Word(kanji: "障る",
         reading: "さわる",
         meanings: [
            "ko": "방해하다, 해치다",
            "en": "To hinder, to harm",
            "ja": "障る",
            "zh-Hans": "妨碍"
         ]),
    Word(kanji: "仕上がる",
         reading: "しあがる",
         meanings: [
            "ko": "완성되다, 끝나다",
            "en": "To be finished, to be completed",
            "ja": "仕上がる",
            "zh-Hans": "完成"
         ]),
    Word(kanji: "慕う",
         reading: "したう",
         meanings: [
            "ko": "그리워하다, 동경하다",
            "en": "To yearn for, to long for",
            "ja": "慕う",
            "zh-Hans": "仰慕"
         ]),
    Word(kanji: "忍ぶ",
         reading: "しのぶ",
         meanings: [
            "ko": "참다, 견디다",
            "en": "To endure, to bear",
            "ja": "忍ぶ",
            "zh-Hans": "忍耐"
         ]),
    Word(kanji: "退く",
         reading: "しりぞく",
         meanings: [
            "ko": "물러나다, 철수하다",
            "en": "To retreat, to withdraw",
            "ja": "退く",
            "zh-Hans": "退下"
         ]),
    Word(kanji: "廃れる",
         reading: "すたれる",
         meanings: [
            "ko": "쇠퇴하다, 유행이 지나다",
            "en": "To become obsolete, to go out of fashion",
            "ja": "廃れる",
            "zh-Hans": "废弃"
         ]),
    Word(kanji: "急かす",
         reading: "せかす",
         meanings: [
            "ko": "재촉하다, 서두르게 하다",
            "en": "To hurry, to urge on",
            "ja": "急かす",
            "zh-Hans": "催促"
         ]),
    Word(kanji: "迫る",
         reading: "せまる",
         meanings: [
            "ko": "다가오다, 가까워지다",
            "en": "To approach, to draw near",
            "ja": "迫る",
            "zh-Hans": "逼近"
         ]),
    Word(kanji: "損なう",
         reading: "そこなう",
         meanings: [
            "ko": "해치다, 손상시키다",
            "en": "To harm, to damage",
            "ja": "損なう",
            "zh-Hans": "损害"
         ]),
    Word(kanji: "逸れる",
         reading: "それる",
         meanings: [
            "ko": "빗나가다, 벗어나다",
            "en": "To deviate, to stray",
            "ja": "逸れる",
            "zh-Hans": "偏离"
         ]),
    Word(kanji: "託す",
         reading: "たくす",
         meanings: [
            "ko": "맡기다, 위임하다",
            "en": "To entrust, to leave to",
            "ja": "託す",
            "zh-Hans": "委托"
         ]),
    Word(kanji: "蓄える",
         reading: "たくわえる",
         meanings: [
            "ko": "저장하다, 축적하다",
            "en": "To store, to accumulate",
            "ja": "蓄える",
            "zh-Hans": "储存"
         ]),
    Word(kanji: "携わる",
         reading: "たずさわる",
         meanings: [
            "ko": "관여하다, 참여하다",
            "en": "To engage in, to participate in",
            "ja": "携わる",
            "zh-Hans": "参与"
         ]),
    Word(kanji: "漂う",
         reading: "ただよう",
         meanings: [
            "ko": "떠다니다, 흐르다",
            "en": "To drift, to float",
            "ja": "漂う",
            "zh-Hans": "漂浮"
         ]),
    Word(kanji: "立て替える",
         reading: "たてかえる",
         meanings: [
            "ko": "대신 지불하다, 대신하다",
            "en": "To pay for, to cover (costs)",
            "ja": "立て替える",
            "zh-Hans": "垫付"
         ]),
    Word(kanji: "費やす",
         reading: "ついやす",
         meanings: [
            "ko": "소비하다, 쓰다",
            "en": "To spend, to consume",
            "ja": "費やす",
            "zh-Hans": "花费"
         ]),
    Word(kanji: "突き止める",
         reading: "つきとめる",
         meanings: [
            "ko": "확인하다, 밝혀내다",
            "en": "To ascertain, to determine",
            "ja": "突き止める",
            "zh-Hans": "查明"
         ]),
    Word(kanji: "尽くす",
         reading: "つくす",
         meanings: [
            "ko": "다 써버리다, 헌신하다",
            "en": "To exhaust, to devote oneself",
            "ja": "尽くす",
            "zh-Hans": "竭尽"
         ]),
    Word(kanji: "償う",
         reading: "つぐなう",
         meanings: [
            "ko": "보상하다, 갚다",
            "en": "To compensate, to atone",
            "ja": "償う",
            "zh-Hans": "补偿"
         ]),
    Word(kanji: "告げる",
         reading: "つげる",
         meanings: [
            "ko": "알리다, 말하다",
            "en": "To inform, to tell",
            "ja": "告げる",
            "zh-Hans": "告知"
         ]),
    Word(kanji: "培う",
         reading: "つちかう",
         meanings: [
            "ko": "기르다, 육성하다",
            "en": "To cultivate, to foster",
            "ja": "培う",
            "zh-Hans": "培养"
         ]),
    Word(kanji: "慎む",
         reading: "つつしむ",
         meanings: [
            "ko": "삼가다, 자제하다",
            "en": "To refrain, to be discreet",
            "ja": "慎む",
            "zh-Hans": "谨慎"
         ]),
    Word(kanji: "集う",
         reading: "つどう",
         meanings: [
            "ko": "모이다, 집회하다",
            "en": "To gather, to assemble",
            "ja": "集う",
            "zh-Hans": "聚集"
         ]),
    Word(kanji: "募る",
         reading: "つのる",
         meanings: [
            "ko": "모집하다, 구하다",
            "en": "To recruit, to solicit",
            "ja": "募る",
            "zh-Hans": "招募"
         ]),
    Word(kanji: "積み立てる",
         reading: "つみたてる",
         meanings: [
            "ko": "저축하다, 쌓아두다",
            "en": "To save up, to accumulate",
            "ja": "積み立てる",
            "zh-Hans": "积累"
         ]),
    Word(kanji: "貫く",
         reading: "つらぬく",
         meanings: [
            "ko": "관통하다, 실행하다",
            "en": "To penetrate, to carry out",
            "ja": "貫く",
            "zh-Hans": "贯穿"
         ]),
    Word(kanji: "遠ざける",
         reading: "とおざける",
         meanings: [
            "ko": "멀리하다, 거리를 두다",
            "en": "To distance, to keep away",
            "ja": "遠ざける",
            "zh-Hans": "疏远"
         ]),
    Word(kanji: "説く",
         reading: "とく",
         meanings: [
            "ko": "설명하다, 주장하다",
            "en": "To explain, to advocate",
            "ja": "説く",
            "zh-Hans": "说明"
         ]),
    Word(kanji: "遂げる",
         reading: "とげる",
         meanings: [
            "ko": "이루다, 달성하다",
            "en": "To accomplish, to achieve",
            "ja": "遂げる",
            "zh-Hans": "完成"
         ]),
    Word(kanji: "滞る",
         reading: "とどこおる",
         meanings: [
            "ko": "지연되다, 정체되다",
            "en": "To be delayed, to stagnate",
            "ja": "滞る",
            "zh-Hans": "停滞"
         ]),
    Word(kanji: "唱える",
         reading: "となえる",
         meanings: [
            "ko": "외치다, 주장하다",
            "en": "To chant, to recite",
            "ja": "唱える",
            "zh-Hans": "吟诵"
         ]),
    Word(kanji: "戸惑う",
         reading: "とまどう",
         meanings: [
            "ko": "당황하다, 혼란스러워하다",
            "en": "To be bewildered, to be perplexed",
            "ja": "戸惑う",
            "zh-Hans": "困惑"
         ]),
    Word(kanji: "取り組む",
         reading: "とりくむ",
         meanings: [
            "ko": "맡다, 참여하다",
            "en": "To tackle, to engage",
            "ja": "取り組む",
            "zh-Hans": "致力于"
         ]),
    Word(kanji: "取り締まる",
         reading: "とりしまる",
         meanings: [
            "ko": "단속하다, 통제하다",
            "en": "To crack down on, to control",
            "ja": "取り締まる",
            "zh-Hans": "管制"
         ]),
    Word(kanji: "取り戻す",
         reading: "とりもどす",
         meanings: [
            "ko": "되찾다, 회복하다",
            "en": "To take back, to regain",
            "ja": "取り戻す",
            "zh-Hans": "取回"
         ]),
    Word(kanji: "賑わう",
         reading: "にぎわう",
         meanings: [
            "ko": "번성하다, 활발해지다",
            "en": "To be lively, to flourish",
            "ja": "賑わう",
            "zh-Hans": "热闹"
         ]),
    Word(kanji: "担う",
         reading: "になう",
         meanings: [
            "ko": "맡다, 책임지다",
            "en": "To bear, to shoulder",
            "ja": "担う",
            "zh-Hans": "承担"
         ]),
    Word(kanji: "鈍る",
         reading: "にぶる",
         meanings: [
            "ko": "둔해지다, 약해지다",
            "en": "To become dull, to weaken",
            "ja": "鈍る",
            "zh-Hans": "迟钝"
         ]),
    Word(kanji: "逃れる",
         reading: "のがれる",
         meanings: [
            "ko": "피하다, 벗어나다",
            "en": "To escape, to evade",
            "ja": "逃れる",
            "zh-Hans": "逃避"
         ]),
    Word(kanji: "臨む",
         reading: "のぞむ",
         meanings: [
            "ko": "직면하다, 참석하다",
            "en": "To face, to attend",
            "ja": "臨む",
            "zh-Hans": "面临"
         ]),
    Word(kanji: "乗り出す",
         reading: "のりだす",
         meanings: [
            "ko": "나서다, 착수하다",
            "en": "To embark on, to set out",
            "ja": "乗り出す",
            "zh-Hans": "着手"
         ]),
    Word(kanji: "剥がす",
         reading: "はがす",
         meanings: [
            "ko": "벗기다, 제거하다",
            "en": "To peel off, to remove",
            "ja": "剥がす",
            "zh-Hans": "剥下"
         ]),
    Word(kanji: "捗る",
         reading: "はかどる",
         meanings: [
            "ko": "진척되다, 진행되다",
            "en": "To make progress, to advance",
            "ja": "捗る",
            "zh-Hans": "进展"
         ]),
    Word(kanji: "励む",
         reading: "はげむ",
         meanings: [
            "ko": "노력하다, 열심히 하다",
            "en": "To strive, to work hard",
            "ja": "励む",
            "zh-Hans": "努力"
         ]),
    Word(kanji: "弾む",
         reading: "はずむ",
         meanings: [
            "ko": "튀다, 기운차다",
            "en": "To bounce, to spring",
            "ja": "弾む",
            "zh-Hans": "弹跳"
         ]),
    Word(kanji: "阻む",
         reading: "はばむ",
         meanings: [
            "ko": "막다, 방해하다",
            "en": "To prevent, to obstruct",
            "ja": "阻む",
            "zh-Hans": "阻止"
         ]),
    Word(kanji: "張り合う",
         reading: "はりあう",
         meanings: [
            "ko": "경쟁하다, 맞서다",
            "en": "To compete with, to rival",
            "ja": "張り合う",
            "zh-Hans": "竞争"
         ]),
    Word(kanji: "張り切る",
         reading: "はりきる",
         meanings: [
            "ko": "열심히 하다, 기운차다",
            "en": "To be enthusiastic, to be eager",
            "ja": "張り切る",
            "zh-Hans": "干劲十足"
         ]),
    Word(kanji: "控える",
         reading: "ひかえる",
         meanings: [
            "ko": "자제하다, 삼가다",
            "en": "To hold back, to refrain",
            "ja": "控える",
            "zh-Hans": "控制"
         ]),
    Word(kanji: "率いる",
         reading: "ひきいる",
         meanings: [
            "ko": "이끌다, 지휘하다",
            "en": "To lead, to command",
            "ja": "率いる",
            "zh-Hans": "率领"
         ]),
    Word(kanji: "引き落とす",
         reading: "ひきおとす",
         meanings: [
            "ko": "인출하다, 공제하다",
            "en": "To withdraw (money), to deduct",
            "ja": "引き落とす",
            "zh-Hans": "扣除"
         ]),
    Word(kanji: "引き寄せる",
         reading: "ひきよせる",
         meanings: [
            "ko": "당기다, 끌어당기다",
            "en": "To pull towards, to attract",
            "ja": "引き寄せる",
            "zh-Hans": "拉近"
         ]),
    Word(kanji: "響く",
         reading: "ひびく",
         meanings: [
            "ko": "울리다, 반향하다",
            "en": "To resonate, to echo",
            "ja": "響く",
            "zh-Hans": "回响"
         ]),
    Word(kanji: "秘める",
         reading: "ひめる",
         meanings: [
            "ko": "숨기다, 감추다",
            "en": "To hide, to conceal",
            "ja": "秘める",
            "zh-Hans": "隐藏"
         ]),
    Word(kanji: "翻す",
         reading: "ひるがえす",
         meanings: [
            "ko": "뒤집다, 전환하다",
            "en": "To flip, to turn over",
            "ja": "翻す",
            "zh-Hans": "翻转"
         ]),
    Word(kanji: "隔てる",
         reading: "へだてる",
         meanings: [
            "ko": "분리하다, 나누다",
            "en": "To separate, to divide",
            "ja": "隔てる",
            "zh-Hans": "隔离"
         ]),
    Word(kanji: "解ける",
         reading: "ほどける",
         meanings: [
            "ko": "풀리다, 풀어지다",
            "en": "To come loose, to be untied",
            "ja": "解ける",
            "zh-Hans": "解开"
         ]),
    Word(kanji: "施す",
         reading: "ほどこす",
         meanings: [
            "ko": "베풀다, 시행하다",
            "en": "To give, to perform",
            "ja": "施す",
            "zh-Hans": "施行"
         ]),
    Word(kanji: "滅びる",
         reading: "ほろびる",
         meanings: [
            "ko": "멸망하다, 파괴되다",
            "en": "To perish, to be ruined",
            "ja": "滅びる",
            "zh-Hans": "灭亡"
         ]),
    Word(kanji: "紛れる",
         reading: "まぎれる",
         meanings: [
            "ko": "섞이다, 사라지다",
            "en": "To be diverted, to disappear into",
            "ja": "紛れる",
            "zh-Hans": "混淆"
         ]),
    Word(kanji: "惑わす",
         reading: "まどわす",
         meanings: [
            "ko": "혼란시키다, 속이다",
            "en": "To bewilder, to perplex",
            "ja": "惑わす",
            "zh-Hans": "迷惑"
         ]),
    Word(kanji: "免れる",
         reading: "まぬかれる",
         meanings: [
            "ko": "피하다, 벗어나다",
            "en": "To escape, to avoid",
            "ja": "免れる",
            "zh-Hans": "避免"
         ]),
    Word(kanji: "見合わせる",
         reading: "みあわせる",
         meanings: [
            "ko": "연기하다, 비교하다",
            "en": "To postpone, to compare",
            "ja": "見合わせる",
            "zh-Hans": "推迟"
         ]),
    Word(kanji: "見失う",
         reading: "みうしなう",
         meanings: [
            "ko": "놓치다, 잃어버리다",
            "en": "To lose sight of, to miss",
            "ja": "見失う",
            "zh-Hans": "迷失"
         ]),
    Word(kanji: "見落とす",
         reading: "みおとす",
         meanings: [
            "ko": "놓치다, 간과하다",
            "en": "To overlook, to miss",
            "ja": "見落とす",
            "zh-Hans": "忽略"
         ]),
    Word(kanji: "設ける",
         reading: "もうける",
         meanings: [
            "ko": "설립하다, 준비하다",
            "en": "To establish, to prepare",
            "ja": "設ける",
            "zh-Hans": "设立"
         ]),
    Word(kanji: "催す",
         reading: "もよおす",
         meanings: [
            "ko": "개최하다, 느끼다",
            "en": "To hold (an event), to feel (a sensation)",
            "ja": "催す",
            "zh-Hans": "举办"
         ]),
    Word(kanji: "養う",
         reading: "やしなう",
         meanings: [
            "ko": "기르다, 부양하다",
            "en": "To foster, to support",
            "ja": "養う",
            "zh-Hans": "养育"
         ]),
    Word(kanji: "安らぐ",
         reading: "やすらぐ",
         meanings: [
            "ko": "편안해지다, 안정되다",
            "en": "To feel at ease, to relax",
            "ja": "安らぐ",
            "zh-Hans": "安宁"
         ]),
    Word(kanji: "和らぐ",
         reading: "やわらぐ",
         meanings: [
            "ko": "부드러워지다, 진정되다",
            "en": "To soften, to calm down",
            "ja": "和らぐ",
            "zh-Hans": "缓和"
         ]),
    Word(kanji: "揺らぐ",
         reading: "ゆらぐ",
         meanings: [
            "ko": "흔들리다, 동요하다",
            "en": "To shake, to waver",
            "ja": "揺らぐ",
            "zh-Hans": "动摇"
         ]),
    Word(kanji: "揺るがす",
         reading: "ゆるがす",
         meanings: [
            "ko": "흔들다, 동요시키다",
            "en": "To shake, to disturb",
            "ja": "揺るがす",
            "zh-Hans": "动摇"
         ]),
    Word(kanji: "緩める",
         reading: "ゆるめる",
         meanings: [
            "ko": "늦추다, 풀다",
            "en": "To loosen, to relax",
            "ja": "緩める",
            "zh-Hans": "放松"
         ]),
    Word(kanji: "装う",
         reading: "よそおう",
         meanings: [
            "ko": "꾸미다, 가장하다",
            "en": "To dress, to pretend",
            "ja": "装う",
            "zh-Hans": "装扮"
         ]),
    Word(kanji: "詫びる",
         reading: "わびる",
         meanings: [
            "ko": "사과하다, 용서를 구하다",
            "en": "To apologize",
            "ja": "詫びる",
            "zh-Hans": "道歉"
         ]),
    Word(kanji: "割り込む",
         reading: "わりこむ",
         meanings: [
            "ko": "끼어들다, 방해하다",
            "en": "To cut in, to interrupt",
            "ja": "割り込む",
            "zh-Hans": "插队"
         ]),
    Word(kanji: "淡い",
         reading: "あわい",
         meanings: [
            "ko": "희미한, 연한",
            "en": "Faint, pale",
            "ja": "淡い",
            "zh-Hans": "淡的"
         ]),
    Word(kanji: "潔い",
         reading: "いさぎよい",
         meanings: [
            "ko": "깨끗한, 결백한",
            "en": "Manly, pure-hearted",
            "ja": "潔い",
            "zh-Hans": "纯洁"
         ]),
    Word(kanji: "薄暗い",
         reading: "うすぐらい",
         meanings: [
            "ko": "어두운, 희미한",
            "en": "Dim, gloomy",
            "ja": "薄暗い",
            "zh-Hans": "昏暗"
         ]),
    Word(kanji: "疑わしい",
         reading: "うたがわしい",
         meanings: [
            "ko": "의심스러운, 수상한",
            "en": "Doubtful, questionable",
            "ja": "疑わしい",
            "zh-Hans": "可疑"
         ]),
    Word(kanji: "重々しい",
         reading: "おもおもしい",
         meanings: [
            "ko": "엄숙한, 무거운",
            "en": "Grave, solemn",
            "ja": "重々しい",
            "zh-Hans": "庄重"
         ]),
    Word(kanji: "清い",
         reading: "きよい",
         meanings: [
            "ko": "깨끗한, 순수한",
            "en": "Pure, clean",
            "ja": "清い",
            "zh-Hans": "清澈"
         ]),
    Word(kanji: "心地よい",
         reading: "ここちよい",
         meanings: [
            "ko": "기분 좋은, 편안한",
            "en": "Comfortable, pleasant",
            "ja": "心地よい",
            "zh-Hans": "舒适"
         ]),
    Word(kanji: "心無い",
         reading: "こころない",
         meanings: [
            "ko": "무심한, 냉정한",
            "en": "Heartless, cruel",
            "ja": "心無い",
            "zh-Hans": "无情"
         ]),
    Word(kanji: "快い",
         reading: "こころよい",
         meanings: [
            "ko": "기분 좋은, 유쾌한",
            "en": "Pleasant, agreeable",
            "ja": "快い",
            "zh-Hans": "愉快"
         ]),
    Word(kanji: "騒々しい",
         reading: "そうぞうしい",
         meanings: [
            "ko": "시끄러운, 떠들썩한",
            "en": "Noisy, boisterous",
            "ja": "騒々しい",
            "zh-Hans": "喧闹"
         ]),
    Word(kanji: "容易い",
         reading: "たやすい",
         meanings: [
            "ko": "쉬운, 간단한",
            "en": "Easy, simple",
            "ja": "容易い",
            "zh-Hans": "容易"
         ]),
    Word(kanji: "注意深い",
         reading: "ちゅういぶかい",
         meanings: [
            "ko": "주의 깊은, 신중한",
            "en": "Careful, cautious",
            "ja": "注意深い",
            "zh-Hans": "细心"
         ]),
    Word(kanji: "粘り強い",
         reading: "ねばりづよい",
         meanings: [
            "ko": "끈기 있는, 인내심 있는",
            "en": "Persistent, tenacious",
            "ja": "粘り強い",
            "zh-Hans": "坚韧"
         ]),
    Word(kanji: "望ましい",
         reading: "のぞましい",
         meanings: [
            "ko": "바람직한, 좋은",
            "en": "Desirable, preferable",
            "ja": "望ましい",
            "zh-Hans": "理想"
         ]),
    Word(kanji: "甚だしい",
         reading: "はなはだしい",
         meanings: [
            "ko": "심한, 극심한",
            "en": "Extreme, excessive",
            "ja": "甚だしい",
            "zh-Hans": "严重"
         ]),
    Word(kanji: "華々しい",
         reading: "はなばなしい",
         meanings: [
            "ko": "화려한, 눈부신",
            "en": "Spectacular, splendid",
            "ja": "華々しい",
            "zh-Hans": "华丽"
         ]),
    Word(kanji: "幅広い",
         reading: "はばひろい",
         meanings: [
            "ko": "넓은, 광범위한",
            "en": "Wide, broad",
            "ja": "幅広い",
            "zh-Hans": "广泛"
         ]),
    Word(kanji: "分厚い",
         reading: "ぶあつい",
         meanings: [
            "ko": "두꺼운, 굵은",
            "en": "Thick, bulky",
            "ja": "分厚い",
            "zh-Hans": "厚实"
         ]),
    Word(kanji: "紛らわしい",
         reading: "まぎらわしい",
         meanings: [
            "ko": "혼란스러운, 헷갈리는",
            "en": "Confusing, misleading",
            "ja": "紛らわしい",
            "zh-Hans": "混淆"
         ]),
    Word(kanji: "目覚ましい",
         reading: "めざましい",
         meanings: [
            "ko": "눈부신, 놀라운",
            "en": "Remarkable, striking",
            "ja": "目覚ましい",
            "zh-Hans": "显著"
         ]),
    Word(kanji: "物々しい",
         reading: "ものものしい",
         meanings: [
            "ko": "과장된, 웅장한",
            "en": "Pompous, impressive",
            "ja": "物々しい",
            "zh-Hans": "隆重"
         ]),
    Word(kanji: "煩わしい",
         reading: "わずらわしい",
         meanings: [
            "ko": "귀찮은, 성가신",
            "en": "Annoying, troublesome",
            "ja": "煩わしい",
            "zh-Hans": "麻烦"
         ]),
    Word(kanji: "円滑な",
         reading: "えんかつな",
         meanings: [
            "ko": "원활한, 순조로운",
            "en": "Smooth, harmonious",
            "ja": "円滑な",
            "zh-Hans": "顺利"
         ]),
    Word(kanji: "厳かな",
         reading: "おごそかな",
         meanings: [
            "ko": "엄숙한, 장엄한",
            "en": "Solemn, dignified",
            "ja": "厳かな",
            "zh-Hans": "庄严"
         ]),
    Word(kanji: "愚かな",
         reading: "おろかな",
         meanings: [
            "ko": "어리석은, 바보 같은",
            "en": "Foolish, stupid",
            "ja": "愚かな",
            "zh-Hans": "愚蠢"
         ]),
    Word(kanji: "疎かな",
         reading: "おろそかな",
         meanings: [
            "ko": "소홀한, 부주의한",
            "en": "Negligent, careless",
            "ja": "疎かな",
            "zh-Hans": "疏忽"
         ]),
    Word(kanji: "画一的な",
         reading: "かくいつてきな",
         meanings: [
            "ko": "표준화된, 획일적인",
            "en": "Standardized, uniform",
            "ja": "画一的な",
            "zh-Hans": "统一"
         ]),
    Word(kanji: "頑なな",
         reading: "かたくなな",
         meanings: [
            "ko": "고집스러운, 완고한",
            "en": "Stubborn, obstinate",
            "ja": "頑なな",
            "zh-Hans": "固执"
         ]),
    Word(kanji: "画期的な",
         reading: "かっきてきな",
         meanings: [
            "ko": "획기적인, 혁신적인",
            "en": "Groundbreaking, epoch-making",
            "ja": "画期的な",
            "zh-Hans": "划时代"
         ]),
    Word(kanji: "頑固な",
         reading: "がんこな",
         meanings: [
            "ko": "고집스러운, 완고한",
            "en": "Stubborn, persistent",
            "ja": "頑固な",
            "zh-Hans": "顽固"
         ]),
    Word(kanji: "頑丈な",
         reading: "がんじょうな",
         meanings: [
            "ko": "튼튼한, 견고한",
            "en": "Sturdy, strong",
            "ja": "頑丈な",
            "zh-Hans": "坚固"
         ]),
    Word(kanji: "肝心な",
         reading: "かんじんな",
         meanings: [
            "ko": "중요한, 필수적인",
            "en": "Essential, crucial",
            "ja": "肝心な",
            "zh-Hans": "关键"
         ]),
    Word(kanji: "閑静な",
         reading: "かんせいな",
         meanings: [
            "ko": "조용한, 평온한",
            "en": "Quiet, tranquil",
            "ja": "閑静な",
            "zh-Hans": "安静"
         ]),
    Word(kanji: "完璧な",
         reading: "かんぺきな",
         meanings: [
            "ko": "완벽한, 완전한",
            "en": "Perfect, flawless",
            "ja": "完璧な",
            "zh-Hans": "完美"
         ]),
    Word(kanji: "寛容な",
         reading: "かんような",
         meanings: [
            "ko": "관대한, 너그러운",
            "en": "Tolerant, generous",
            "ja": "寛容な",
            "zh-Hans": "宽容"
         ]),
    Word(kanji: "窮屈な",
         reading: "きゅうくつな",
         meanings: [
            "ko": "답답한, 불편한",
            "en": "Tight, cramped",
            "ja": "窮屈な",
            "zh-Hans": "拘束"
         ]),
    Word(kanji: "強硬な",
         reading: "きょうこうな",
         meanings: [
            "ko": "강경한, 단호한",
            "en": "Firm, strong",
            "ja": "強硬な",
            "zh-Hans": "强硬"
         ]),
    Word(kanji: "強大な",
         reading: "きょうだいな",
         meanings: [
            "ko": "강대한, 막강한",
            "en": "Powerful, mighty",
            "ja": "強大な",
            "zh-Hans": "强大"
         ]),
    Word(kanji: "極端な",
         reading: "きょくたんな",
         meanings: [
            "ko": "극단적인, 과격한",
            "en": "Extreme, radical",
            "ja": "極端な",
            "zh-Hans": "极端"
         ]),
    Word(kanji: "緊密な",
         reading: "きんみつな",
         meanings: [
            "ko": "긴밀한, 밀접한",
            "en": "Close, intimate",
            "ja": "緊密な",
            "zh-Hans": "紧密"
         ]),
    Word(kanji: "堅実な",
         reading: "けんじつな",
         meanings: [
            "ko": "견실한, 안정된",
            "en": "Steady, solid",
            "ja": "堅実な",
            "zh-Hans": "稳健"
         ]),
    Word(kanji: "厳正な",
         reading: "げんせいな",
         meanings: [
            "ko": "엄격한, 엄정한",
            "en": "Strict, rigorous",
            "ja": "厳正な",
            "zh-Hans": "严格"
         ]),
    Word(kanji: "顕著な",
         reading: "けんちょな",
         meanings: [
            "ko": "현저한, 두드러진",
            "en": "Notable, conspicuous",
            "ja": "顕著な",
            "zh-Hans": "显著"
         ]),
    Word(kanji: "高尚な",
         reading: "こうしょうな",
         meanings: [
            "ko": "고상한, 우아한",
            "en": "Noble, refined",
            "ja": "高尚な",
            "zh-Hans": "高尚"
         ]),
    Word(kanji: "巧妙な",
         reading: "こうみょうな",
         meanings: [
            "ko": "교묘한, 영리한",
            "en": "Clever, skillful",
            "ja": "巧妙な",
            "zh-Hans": "巧妙"
         ]),
    Word(kanji: "克明な",
         reading: "こくめいな",
         meanings: [
            "ko": "상세한, 정확한",
            "en": "Detailed, accurate",
            "ja": "克明な",
            "zh-Hans": "详细"
         ]),
    Word(kanji: "質素な",
         reading: "しっそな",
         meanings: [
            "ko": "검소한, 소박한",
            "en": "Simple, plain",
            "ja": "質素な",
            "zh-Hans": "朴素"
         ]),
    Word(kanji: "柔軟な",
         reading: "じゅうなんな",
         meanings: [
            "ko": "유연한, 융통성 있는",
            "en": "Flexible, adaptable",
            "ja": "柔軟な",
            "zh-Hans": "灵活"
         ]),
    Word(kanji: "迅速な",
         reading: "じんそくな",
         meanings: [
            "ko": "신속한, 빠른",
            "en": "Swift, prompt",
            "ja": "迅速な",
            "zh-Hans": "迅速"
         ]),
    Word(kanji: "健やかな",
         reading: "すこやかな",
         meanings: [
            "ko": "건강한, 튼튼한",
            "en": "Healthy, sound",
            "ja": "健やかな",
            "zh-Hans": "健康"
         ]),
    Word(kanji: "速やかな",
         reading: "すみやかな",
         meanings: [
            "ko": "빠른, 신속한",
            "en": "Speedy, quick",
            "ja": "速やかな",
            "zh-Hans": "快速"
         ]),
    Word(kanji: "性急な",
         reading: "せいきゅうな",
         meanings: [
            "ko": "성급한, 조급한",
            "en": "Hasty, impatient",
            "ja": "性急な",
            "zh-Hans": "性急"
         ]),
    Word(kanji: "精巧な",
         reading: "せいこうな",
         meanings: [
            "ko": "정교한, 섬세한",
            "en": "Exquisite, elaborate",
            "ja": "精巧な",
            "zh-Hans": "精巧"
         ]),
    Word(kanji: "切実な",
         reading: "せつじつな",
         meanings: [
            "ko": "절실한, 시급한",
            "en": "Urgent, pressing",
            "ja": "切実な",
            "zh-Hans": "迫切"
         ]),
    Word(kanji: "繊細な",
         reading: "せんさいな",
         meanings: [
            "ko": "섬세한, 예민한",
            "en": "Delicate, sensitive",
            "ja": "繊細な",
            "zh-Hans": "细腻"
         ]),
    Word(kanji: "巧みな",
         reading: "たくみな",
         meanings: [
            "ko": "교묘한, 숙련된",
            "en": "Skillful, clever",
            "ja": "巧みな",
            "zh-Hans": "巧妙"
         ]),
    Word(kanji: "丹念な",
         reading: "たんねんな",
         meanings: [
            "ko": "꼼꼼한, 정성스러운",
            "en": "Careful, thorough",
            "ja": "丹念な",
            "zh-Hans": "细心"
         ]),
    Word(kanji: "手薄な",
         reading: "てうすな",
         meanings: [
            "ko": "부족한, 인력이 모자란",
            "en": "Short-handed, lacking",
            "ja": "手薄な",
            "zh-Hans": "人手不足"
         ]),
    Word(kanji: "的確な",
         reading: "てきかくな",
         meanings: [
            "ko": "정확한, 정밀한",
            "en": "Accurate, precise",
            "ja": "的確な",
            "zh-Hans": "准确"
         ]),
    Word(kanji: "入念な",
         reading: "にゅうねんな",
         meanings: [
            "ko": "꼼꼼한, 세심한",
            "en": "Meticulous, careful",
            "ja": "入念な",
            "zh-Hans": "细致"
         ]),
    Word(kanji: "煩雑な",
         reading: "はんざつな",
         meanings: [
            "ko": "복잡한, 번거로운",
            "en": "Complicated, confusing",
            "ja": "煩雑な",
            "zh-Hans": "繁琐"
         ]),
    Word(kanji: "密かな",
         reading: "ひそかな",
         meanings: [
            "ko": "비밀스러운, 은밀한",
            "en": "Secret, private",
            "ja": "密かな",
            "zh-Hans": "秘密"
         ]),
    Word(kanji: "頻繁な",
         reading: "ひんぱんな",
         meanings: [
            "ko": "빈번한, 자주 있는",
            "en": "Frequent, constant",
            "ja": "頻繁な",
            "zh-Hans": "频繁"
         ]),
    Word(kanji: "無残な",
         reading: "むざんな",
         meanings: [
            "ko": "잔인한, 무자비한",
            "en": "Cruel, ruthless",
            "ja": "無残な",
            "zh-Hans": "残忍"
         ]),
    Word(kanji: "無邪気な",
         reading: "むじゃきな",
         meanings: [
            "ko": "순진한, 천진한",
            "en": "Innocent, naive",
            "ja": "無邪気な",
            "zh-Hans": "天真"
         ]),
    Word(kanji: "無謀な",
         reading: "むぼうな",
         meanings: [
            "ko": "무모한, 경솔한",
            "en": "Reckless, rash",
            "ja": "無謀な",
            "zh-Hans": "鲁莽"
         ]),
    Word(kanji: "綿密な",
         reading: "めんみつな",
         meanings: [
            "ko": "면밀한, 꼼꼼한",
            "en": "Detailed, precise",
            "ja": "綿密な",
            "zh-Hans": "周密"
         ]),
    Word(kanji: "愉快な",
         reading: "ゆかいな",
         meanings: [
            "ko": "유쾌한, 즐거운",
            "en": "Pleasant, delightful",
            "ja": "愉快な",
            "zh-Hans": "愉快"
         ]),
    Word(kanji: "緩やかな",
         reading: "ゆるやかな",
         meanings: [
            "ko": "완만한, 부드러운",
            "en": "Gentle, slow",
            "ja": "緩やかな",
            "zh-Hans": "缓慢"
         ]),
    Word(kanji: "幼稚な",
         reading: "ようちな",
         meanings: [
            "ko": "유치한, 미숙한",
            "en": "Childish, immature",
            "ja": "幼稚な",
            "zh-Hans": "幼稚"
         ]),
    Word(kanji: "冷淡な",
         reading: "れいたんな",
         meanings: [
            "ko": "냉담한, 무관심한",
            "en": "Cold-hearted, indifferent",
            "ja": "冷淡な",
            "zh-Hans": "冷淡"
         ]),
    Word(kanji: "露骨な",
         reading: "ろこつな",
         meanings: [
            "ko": "노골적인, 솔직한",
            "en": "Blatant, frank",
            "ja": "露骨な",
            "zh-Hans": "露骨"
         ]),
    Word(kanji: "圧迫",
         reading: "あっぱく",
         meanings: [
            "ko": "압박, 억압",
            "en": "Pressure, oppression",
            "ja": "圧迫",
            "zh-Hans": "压迫"
         ]),
    Word(kanji: "跡地",
         reading: "あとち",
         meanings: [
            "ko": "부지, 터",
            "en": "Site of a demolished building",
            "ja": "跡地",
            "zh-Hans": "旧址"
         ]),
    Word(kanji: "安静",
         reading: "あんせい",
         meanings: [
            "ko": "안정, 휴식",
            "en": "Rest, quiet",
            "ja": "安静",
            "zh-Hans": "安静"
         ]),
    Word(kanji: "安堵",
         reading: "あんど",
         meanings: [
            "ko": "안심, 안도",
            "en": "Relief, reassurance",
            "ja": "安堵",
            "zh-Hans": "安心"
         ]),
    Word(kanji: "意気込み",
         reading: "いきごみ",
         meanings: [
            "ko": "의욕, 열의",
            "en": "Enthusiasm, motivation",
            "ja": "意気込み",
            "zh-Hans": "干劲"
         ]),
    Word(kanji: "憤り",
         reading: "いきどおり",
         meanings: [
            "ko": "분노, 원망",
            "en": "Anger, resentment",
            "ja": "憤り",
            "zh-Hans": "愤怒"
         ]),
    Word(kanji: "憩い",
         reading: "いこい",
         meanings: [
            "ko": "휴식, 휴가",
            "en": "Rest, relaxation",
            "ja": "憩い",
            "zh-Hans": "休息"
         ]),
    Word(kanji: "意地",
         reading: "いじ",
         meanings: [
            "ko": "고집, 의지",
            "en": "Stubbornness, willpower",
            "ja": "意地",
            "zh-Hans": "固执"
         ]),
    Word(kanji: "異色",
         reading: "いしょく",
         meanings: [
            "ko": "특이한, 독특한",
            "en": "Unusual, unique",
            "ja": "異色",
            "zh-Hans": "特色"
         ]),
    Word(kanji: "委託",
         reading: "いたく",
         meanings: [
            "ko": "위탁, 의뢰",
            "en": "Consignment, entrustment",
            "ja": "委託",
            "zh-Hans": "委托"
         ]),
    Word(kanji: "一環",
         reading: "いっかん",
         meanings: [
            "ko": "일환, 부분",
            "en": "Part (of a larger plan)",
            "ja": "一環",
            "zh-Hans": "一环"
         ]),
    Word(kanji: "逸材",
         reading: "いつざい",
         meanings: [
            "ko": "인재, 재능 있는 사람",
            "en": "Outstanding talent",
            "ja": "逸材",
            "zh-Hans": "人才"
         ]),
    Word(kanji: "一掃",
         reading: "いっそう",
         meanings: [
            "ko": "일소, 청소",
            "en": "Sweep away, clear out",
            "ja": "一掃",
            "zh-Hans": "清除"
         ]),
    Word(kanji: "偽り",
         reading: "いつわり",
         meanings: [
            "ko": "거짓, 허위",
            "en": "Lie, falsehood",
            "ja": "偽り",
            "zh-Hans": "虚假"
         ]),
    Word(kanji: "糸口",
         reading: "いとぐち",
         meanings: [
            "ko": "단서, 실마리",
            "en": "Clue, thread (of a story)",
            "ja": "糸口",
            "zh-Hans": "线索"
         ]),
    Word(kanji: "嫌み",
         reading: "いやみ",
         meanings: [
            "ko": "비꼼, 빈정거림",
            "en": "Sarcasm, irony",
            "ja": "嫌み",
            "zh-Hans": "讽刺"
         ]),
    Word(kanji: "依頼",
         reading: "いらい",
         meanings: [
            "ko": "의뢰, 부탁",
            "en": "Request, commission",
            "ja": "依頼",
            "zh-Hans": "委托"
         ]),
    Word(kanji: "印鑑",
         reading: "いんかん",
         meanings: [
            "ko": "도장, 인장",
            "en": "Seal, stamp",
            "ja": "印鑑",
            "zh-Hans": "印章"
         ]),
    Word(kanji: "内訳",
         reading: "うちわけ",
         meanings: [
            "ko": "내역, 세부",
            "en": "Breakdown, itemization",
            "ja": "内訳",
            "zh-Hans": "明细"
         ]),
    Word(kanji: "器",
         reading: "うつわ",
         meanings: [
            "ko": "그릇, 용기",
            "en": "Vessel, container",
            "ja": "器",
            "zh-Hans": "器皿"
         ]),
    Word(kanji: "裏付け",
         reading: "うらづけ",
         meanings: [
            "ko": "근거, 증거",
            "en": "Support, evidence",
            "ja": "裏付け",
            "zh-Hans": "依据"
         ]),
    Word(kanji: "裏腹",
         reading: "うらはら",
         meanings: [
            "ko": "반대, 정반대",
            "en": "Opposite, reverse",
            "ja": "裏腹",
            "zh-Hans": "相反"
         ]),
    Word(kanji: "影響",
         reading: "えいきょう",
         meanings: [
            "ko": "영향, 효과",
            "en": "Influence, effect",
            "ja": "影響",
            "zh-Hans": "影响"
         ]),
    Word(kanji: "閲覧",
         reading: "えつらん",
         meanings: [
            "ko": "열람, 검토",
            "en": "Browsing, perusal",
            "ja": "閲覧",
            "zh-Hans": "浏览"
         ]),
    Word(kanji: "獲物",
         reading: "えもの",
         meanings: [
            "ko": "사냥감, 전리품",
            "en": "Game, prey",
            "ja": "獲物",
            "zh-Hans": "猎物"
         ]),
    Word(kanji: "遠隔",
         reading: "えんかく",
         meanings: [
            "ko": "원격, 먼 거리",
            "en": "Remote, distant",
            "ja": "遠隔",
            "zh-Hans": "远程"
         ]),
    Word(kanji: "大筋",
         reading: "おおすじ",
         meanings: [
            "ko": "개요, 대강",
            "en": "Outline, gist",
            "ja": "大筋",
            "zh-Hans": "大纲"
         ]),
    Word(kanji: "改革",
         reading: "かいかく",
         meanings: [
            "ko": "개혁, 개선",
            "en": "Reform, reformation",
            "ja": "改革",
            "zh-Hans": "改革"
         ]),
    Word(kanji: "回顧",
         reading: "かいこ",
         meanings: [
            "ko": "회고, 추억",
            "en": "Reminiscence, retrospect",
            "ja": "回顧",
            "zh-Hans": "回顾"
         ]),
    Word(kanji: "会心",
         reading: "かいしん",
         meanings: [
            "ko": "만족, 기쁨",
            "en": "Satisfaction, gratification",
            "ja": "会心",
            "zh-Hans": "满意"
         ]),
    Word(kanji: "該当",
         reading: "がいとう",
         meanings: [
            "ko": "해당, 부합",
            "en": "Correspondence, relevance",
            "ja": "該当",
            "zh-Hans": "符合"
         ]),
    Word(kanji: "概略",
         reading: "がいりゃく",
         meanings: [
            "ko": "개략, 요약",
            "en": "Outline, summary",
            "ja": "概略",
            "zh-Hans": "概要"
         ]),
    Word(kanji: "核心",
         reading: "かくしん",
         meanings: [
            "ko": "핵심, 중심",
            "en": "Core, essence",
            "ja": "核心",
            "zh-Hans": "核心"
         ]),
    Word(kanji: "革新",
         reading: "かくしん",
         meanings: [
            "ko": "혁신, 개혁",
            "en": "Innovation, reform",
            "ja": "革新",
            "zh-Hans": "革新"
         ]),
    Word(kanji: "格段",
         reading: "かくだん",
         meanings: [
            "ko": "현저한, 뛰어난",
            "en": "Remarkable, exceptional",
            "ja": "格段",
            "zh-Hans": "显著"
         ]),
    Word(kanji: "過疎",
         reading: "かそ",
         meanings: [
            "ko": "인구 감소, 쇠퇴",
            "en": "Depopulation",
            "ja": "過疎",
            "zh-Hans": "过疏"
         ]),
    Word(kanji: "合致",
         reading: "がっち",
         meanings: [
            "ko": "일치, 부합",
            "en": "Agreement, conformity",
            "ja": "合致",
            "zh-Hans": "一致"
         ]),
    Word(kanji: "合併",
         reading: "がっぺい",
         meanings: [
            "ko": "합병, 통합",
            "en": "Merger, consolidation",
            "ja": "合併",
            "zh-Hans": "合并"
         ]),
    Word(kanji: "活躍",
         reading: "かつやく",
         meanings: [
            "ko": "활약, 활발한 활동",
            "en": "Activity, great efforts",
            "ja": "活躍",
            "zh-Hans": "活跃"
         ]),
    Word(kanji: "稼働",
         reading: "かどう",
         meanings: [
            "ko": "가동, 운영",
            "en": "Operation, working",
            "ja": "稼働",
            "zh-Hans": "运转"
         ]),
    Word(kanji: "過密",
         reading: "かみつ",
         meanings: [
            "ko": "과밀, 혼잡",
            "en": "Congestion, overcrowding",
            "ja": "過密",
            "zh-Hans": "过密"
         ]),
    Word(kanji: "歓迎",
         reading: "かんげい",
         meanings: [
            "ko": "환영, 맞이",
            "en": "Welcome, reception",
            "ja": "歓迎",
            "zh-Hans": "欢迎"
         ]),
    Word(kanji: "完結",
         reading: "かんけつ",
         meanings: [
            "ko": "완결, 마무리",
            "en": "Conclusion, completion",
            "ja": "完結",
            "zh-Hans": "完结"
         ]),
    Word(kanji: "還元",
         reading: "かんげん",
         meanings: [
            "ko": "환원, 반환",
            "en": "Reduction, return",
            "ja": "還元",
            "zh-Hans": "还原"
         ]),
    Word(kanji: "感染",
         reading: "かんせん",
         meanings: [
            "ko": "감염, 전염",
            "en": "Infection, contagion",
            "ja": "感染",
            "zh-Hans": "感染"
         ]),
    Word(kanji: "勘違い",
         reading: "かんちがい",
         meanings: [
            "ko": "오해, 착각",
            "en": "Misunderstanding, misconception",
            "ja": "勘違い",
            "zh-Hans": "误解"
         ]),
    Word(kanji: "鑑定",
         reading: "かんてい",
         meanings: [
            "ko": "감정, 평가",
            "en": "Appraisal, expert opinion",
            "ja": "鑑定",
            "zh-Hans": "鉴定"
         ]),
    Word(kanji: "慣例",
         reading: "かんれい",
         meanings: [
            "ko": "관례, 관행",
            "en": "Custom, precedent",
            "ja": "慣例",
            "zh-Hans": "惯例"
         ]),
    Word(kanji: "緩和",
         reading: "かんわ",
         meanings: [
            "ko": "완화, 완화",
            "en": "Easing, relaxation",
            "ja": "緩和",
            "zh-Hans": "缓和"
         ]),
    Word(kanji: "記載",
         reading: "きさい",
         meanings: [
            "ko": "기재, 기록",
            "en": "Mention, record",
            "ja": "記載",
            "zh-Hans": "记载"
         ]),
    Word(kanji: "兆し",
         reading: "きざし",
         meanings: [
            "ko": "징조, 조짐",
            "en": "Sign, indication",
            "ja": "兆し",
            "zh-Hans": "征兆"
         ]),
    Word(kanji: "儀式",
         reading: "ぎしき",
         meanings: [
            "ko": "의식, 예식",
            "en": "Ceremony, ritual",
            "ja": "儀式",
            "zh-Hans": "仪式"
         ]),
    Word(kanji: "偽造",
         reading: "ぎぞう",
         meanings: [
            "ko": "위조, 조작",
            "en": "Forgery, counterfeit",
            "ja": "偽造",
            "zh-Hans": "伪造"
         ]),
    Word(kanji: "軌道",
         reading: "きどう",
         meanings: [
            "ko": "궤도, 진행 방향",
            "en": "Orbit, track",
            "ja": "軌道",
            "zh-Hans": "轨道"
         ]),
    Word(kanji: "起動",
         reading: "きどう",
         meanings: [
            "ko": "시동, 시작",
            "en": "Startup, activation",
            "ja": "起動",
            "zh-Hans": "启动"
         ]),
    Word(kanji: "基盤",
         reading: "きばん",
         meanings: [
            "ko": "기반, 토대",
            "en": "Foundation, base",
            "ja": "基盤",
            "zh-Hans": "基础"
         ]),
    Word(kanji: "起伏",
         reading: "きふく",
         meanings: [
            "ko": "기복, 변화",
            "en": "Ups and downs, undulation",
            "ja": "起伏",
            "zh-Hans": "起伏"
         ]),
    Word(kanji: "規模",
         reading: "きぼ",
         meanings: [
            "ko": "규모, 범위",
            "en": "Scale, scope",
            "ja": "規模",
            "zh-Hans": "规模"
         ]),
    Word(kanji: "脚本",
         reading: "きゃくほん",
         meanings: [
            "ko": "각본, 시나리오",
            "en": "Script, scenario",
            "ja": "脚本",
            "zh-Hans": "剧本"
         ]),
    Word(kanji: "救援",
         reading: "きゅうえん",
         meanings: [
            "ko": "구원, 구조",
            "en": "Rescue, relief",
            "ja": "救援",
            "zh-Hans": "救援"
         ]),
    Word(kanji: "愛",
         reading: "あい",
         meanings: [
            "ko": "사랑",
            "en": "love",
            "ja": "愛",
            "zh-Hans": "爱"
         ]),
    Word(kanji: "希望",
         reading: "きぼう",
         meanings: [
            "ko": "희망",
            "en": "hope",
            "ja": "希望",
            "zh-Hans": "希望"
         ]),
    Word(kanji: "幸福",
         reading: "こうふく",
         meanings: [
            "ko": "행복",
            "en": "happiness",
            "ja": "幸福",
            "zh-Hans": "幸福"
         ])
    ]
