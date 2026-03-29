import React, { useState, useEffect } from 'react';
import { 
  Bell, 
  MapPin, 
  Calendar, 
  Trophy, 
  User, 
  Plus, 
  CheckCircle, 
  ArrowRight,
  TrendingUp,
  Clock,
  Wallet
} from 'lucide-react';

const App = () => {
  const [activeTab, setActiveTab] = useState('home');
  const [showChallengeDetail, setShowChallengeDetail] = useState(null);
  const [userPoints, setUserPoints] = useState(2500);

  // 파스텔 톤 컬러 팔레트
  const colors = {
    primary: '#B8E1FF', // 파스텔 블루
    secondary: '#FFD1DA', // 파스텔 핑크
    success: '#C1E1C1', // 파스텔 그린
    warning: '#FDFD96', // 파스텔 옐로우
    text: '#4A4A4A',
    bg: '#F8FAFC'
  };

  const myChallenges = [
    { id: 1, title: '1교시(9시) 등교 인증', location: '제1공학관', progress: 80, color: 'bg-blue-100' },
    { id: 2, title: '중앙도서관 3시간 집중', location: '중앙도서관', progress: 45, color: 'bg-pink-100' },
  ];

  const availableChallenges = [
    { 
      id: 3, 
      title: '학식 먹고 산책하기', 
      reward: '학생식당 500원 할인권', 
      bet: '300P',
      participants: 128,
      tags: ['건강', '친목'],
      // 한강 산책 이미지로 교체
      image: 'https://images.unsplash.com/photo-1610471904123-524679758f8b?w=800&q=80'
    },
    { 
      id: 4, 
      title: '오전 10시 도서관 출석', 
      reward: '카페 아메리카노 1+1', 
      bet: '500P',
      participants: 85,
      tags: ['학업', '성실'],
      image: 'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?w=400&q=80'
    }
  ];

  const renderHome = () => (
    <div className="space-y-6 animate-in fade-in duration-500">
      {/* Header Profile */}
      <div className="flex justify-between items-center px-4 pt-4">
        <div>
          <h2 className="text-sm text-gray-500">안녕하세요,</h2>
          <h1 className="text-xl font-bold text-gray-800">김루틴 학생 👋</h1>
        </div>
        <div className="flex gap-3">
          <div className="bg-white p-2 rounded-full shadow-sm">
            <Bell size={20} className="text-gray-600" />
          </div>
          <div className="bg-white p-2 rounded-full shadow-sm">
            <User size={20} className="text-gray-600" />
          </div>
        </div>
      </div>

      {/* Point Card */}
      <div className="mx-4 bg-gradient-to-br from-[#B8E1FF] to-[#D1EAFF] rounded-3xl p-6 shadow-md">
        <div className="flex justify-between items-start mb-4">
          <span className="text-blue-800 font-medium flex items-center gap-1">
            <Wallet size={16} /> 보유 포인트
          </span>
          <TrendingUp size={20} className="text-blue-800" />
        </div>
        <div className="text-3xl font-black text-blue-900 mb-1">{userPoints.toLocaleString()} P</div>
        <p className="text-blue-700 text-xs">이번 주에 500P를 더 획득했어요!</p>
      </div>

      {/* My Current Routine */}
      <div className="px-4">
        <div className="flex justify-between items-center mb-4">
          <h3 className="font-bold text-gray-800">나의 루틴 진행률</h3>
          <span className="text-xs text-blue-500 font-medium">전체보기</span>
        </div>
        <div className="space-y-3">
          {myChallenges.map(ch => (
            <div key={ch.id} className="bg-white p-4 rounded-2xl shadow-sm border border-gray-50 flex items-center gap-4">
              <div className={`${ch.color} p-3 rounded-xl`}>
                <CheckCircle size={24} className="text-gray-700" />
              </div>
              <div className="flex-1">
                <h4 className="font-semibold text-sm text-gray-800">{ch.title}</h4>
                <div className="flex items-center gap-1 text-xs text-gray-400 mt-1">
                  <MapPin size={12} /> {ch.location}
                </div>
                <div className="w-full bg-gray-100 h-1.5 rounded-full mt-3">
                  <div 
                    className="bg-[#B8E1FF] h-1.5 rounded-full" 
                    style={{ width: `${ch.progress}%` }}
                  ></div>
                </div>
              </div>
              <span className="text-xs font-bold text-blue-400">{ch.progress}%</span>
            </div>
          ))}
        </div>
      </div>

      {/* Recommended for you */}
      <div className="px-4 pb-20">
        <h3 className="font-bold text-gray-800 mb-4">추천 챌린지</h3>
        <div className="grid grid-cols-2 gap-4">
          {availableChallenges.map(ch => (
            <div 
              key={ch.id} 
              onClick={() => setShowChallengeDetail(ch)}
              className="bg-white rounded-2xl overflow-hidden shadow-sm border border-gray-50 active:scale-95 transition-transform"
            >
              <div className="h-24 bg-gray-200 relative">
                <img src={ch.image} alt={ch.title} className="w-full h-full object-cover" />
                <div className="absolute top-2 right-2 bg-white/90 px-2 py-1 rounded-lg text-[10px] font-bold text-pink-500">
                  HOT
                </div>
              </div>
              <div className="p-3">
                <h4 className="font-bold text-xs text-gray-800 leading-tight mb-2 h-8">{ch.title}</h4>
                <div className="flex items-center justify-between">
                  <span className="text-[10px] text-gray-400 font-medium">{ch.participants}명 참여중</span>
                  <span className="text-[10px] bg-yellow-100 text-yellow-700 px-1.5 py-0.5 rounded font-bold">{ch.bet}</span>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );

  const renderChallengeDetail = () => (
    <div className="fixed inset-0 bg-white z-50 animate-in slide-in-from-bottom duration-300">
      <div className="h-64 relative">
        <img src={showChallengeDetail.image} alt="detail" className="w-full h-full object-cover" />
        <button 
          onClick={() => setShowChallengeDetail(null)}
          className="absolute top-6 left-4 bg-black/20 backdrop-blur-md text-white p-2 rounded-full"
        >
          <Plus size={24} className="rotate-45" />
        </button>
      </div>
      <div className="p-6 -mt-8 bg-white rounded-t-3xl relative">
        <div className="flex gap-2 mb-4">
          {showChallengeDetail.tags.map(tag => (
            <span key={tag} className="text-[10px] font-bold px-2 py-1 rounded-full bg-blue-50 text-blue-400">#{tag}</span>
          ))}
        </div>
        <h2 className="text-2xl font-bold text-gray-800 mb-2">{showChallengeDetail.title}</h2>
        <div className="flex items-center gap-2 text-sm text-gray-500 mb-6">
          <Clock size={16} /> 매일 오후 10:00 까지 인증
        </div>

        <div className="bg-gray-50 rounded-2xl p-4 mb-6">
          <h4 className="text-sm font-bold text-gray-700 mb-3 underline decoration-blue-200 underline-offset-4">성공 리워드</h4>
          <div className="flex items-center gap-3">
            <div className="bg-yellow-100 p-2 rounded-lg">
              <Trophy size={20} className="text-yellow-600" />
            </div>
            <div>
              <p className="text-sm font-bold text-gray-800">{showChallengeDetail.reward}</p>
              <p className="text-xs text-gray-400">미션 완료 즉시 쿠폰함으로 발급</p>
            </div>
          </div>
        </div>

        <div className="space-y-4">
          <h4 className="text-sm font-bold text-gray-700">챌린지 규칙</h4>
          <ul className="text-xs text-gray-500 space-y-2">
            <li className="flex items-start gap-2">
              <div className="w-1.5 h-1.5 rounded-full bg-blue-300 mt-1"></div>
              <span>지정된 위치(도서관 내부)에서 GPS 인증이 필요합니다.</span>
            </li>
            <li className="flex items-start gap-2">
              <div className="w-1.5 h-1.5 rounded-full bg-blue-300 mt-1"></div>
              <span>사진 인증 시 본인의 학생증 혹은 공부 인증샷이 포함되어야 합니다.</span>
            </li>
            <li className="flex items-start gap-2 text-pink-400 font-bold">
              <div className="w-1.5 h-1.5 rounded-full bg-pink-300 mt-1"></div>
              <span>미션 실패 시 베팅한 {showChallengeDetail.bet}는 소멸됩니다.</span>
            </li>
          </ul>
        </div>

        <div className="fixed bottom-6 left-6 right-6">
          <button 
            onClick={() => {
              setUserPoints(prev => prev - parseInt(showChallengeDetail.bet));
              setShowChallengeDetail(null);
            }}
            className="w-full bg-[#B8E1FF] text-blue-900 font-black py-4 rounded-2xl shadow-lg shadow-blue-100 flex items-center justify-center gap-2 active:scale-95 transition-transform"
          >
            {showChallengeDetail.bet} 베팅하고 참여하기
          </button>
        </div>
      </div>
    </div>
  );

  return (
    <div className="max-w-md mx-auto bg-[#F8FAFC] min-h-screen relative font-sans text-[#4A4A4A] shadow-2xl rounded-[3rem] overflow-hidden border-[8px] border-white">
      {/* Status Bar Mockup */}
      <div className="h-10 px-8 flex justify-between items-end text-[10px] font-bold text-gray-400">
        <span>9:41</span>
        <div className="flex gap-1.5">
          <div className="w-3 h-3 rounded-full border border-gray-300"></div>
          <div className="w-3 h-3 rounded-full bg-gray-300"></div>
        </div>
      </div>

      {/* Main Content Area */}
      <div className="h-[calc(100vh-140px)] overflow-y-auto no-scrollbar">
        {activeTab === 'home' && renderHome()}
        {activeTab === 'map' && (
          <div className="flex flex-col items-center justify-center h-full text-gray-400 p-10 text-center">
            <MapPin size={64} className="mb-4 text-blue-200" />
            <p className="font-bold text-gray-600">내 주변 챌린지 찾기</p>
            <p className="text-xs mt-2">지도를 움직여 학교 주변의<br/>파트너 상점과 챌린지를 확인하세요.</p>
            <div className="mt-8 w-full h-40 bg-blue-50 rounded-3xl border-2 border-dashed border-blue-100 flex items-center justify-center">
              <span className="text-[10px]">MAP INTERFACE LOADED</span>
            </div>
          </div>
        )}
      </div>

      {/* Challenge Detail Modal */}
      {showChallengeDetail && renderChallengeDetail()}

      {/* Bottom Navigation */}
      <div className="absolute bottom-0 left-0 right-0 bg-white/80 backdrop-blur-lg border-t border-gray-100 px-8 py-4 flex justify-between items-center">
        <button onClick={() => setActiveTab('home')} className={`flex flex-col items-center gap-1 ${activeTab === 'home' ? 'text-blue-400' : 'text-gray-300'}`}>
          <Calendar size={20} />
          <span className="text-[10px] font-bold">홈</span>
        </button>
        <button onClick={() => setActiveTab('map')} className={`flex flex-col items-center gap-1 ${activeTab === 'map' ? 'text-blue-400' : 'text-gray-300'}`}>
          <MapPin size={20} />
          <span className="text-[10px] font-bold">상점지도</span>
        </button>
        <div className="relative -mt-12">
          <button className="bg-[#B8E1FF] text-blue-900 p-4 rounded-2xl shadow-lg shadow-blue-200 active:scale-90 transition-transform">
            <Plus size={24} />
          </button>
        </div>
        <button className="flex flex-col items-center gap-1 text-gray-300">
          <Trophy size={20} />
          <span className="text-[10px] font-bold">쿠폰함</span>
        </button>
        <button className="flex flex-col items-center gap-1 text-gray-300">
          <User size={20} />
          <span className="text-[10px] font-bold">마이</span>
        </button>
      </div>

      <style dangerouslySetInnerHTML={{ __html: `
        .no-scrollbar::-webkit-scrollbar { display: none; }
        .no-scrollbar { -ms-overflow-style: none; scrollbar-width: none; }
      `}} />
    </div>
  );
};

export default App;
