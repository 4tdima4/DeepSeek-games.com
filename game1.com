<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Цифровой сад - Вырастите своё виртуальное растение</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #1a3c34 0%, #0d261f 100%);
            color: #e0f2e9;
            min-height: 100vh;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .container {
            max-width: 1200px;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        header {
            text-align: center;
            margin-bottom: 30px;
            width: 100%;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        h1 {
            font-size: 2.8rem;
            margin-bottom: 10px;
            background: linear-gradient(to right, #8bc34a, #4caf50);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        }
        
        .subtitle {
            font-size: 1.2rem;
            opacity: 0.9;
            max-width: 600px;
            margin: 0 auto;
        }
        
        .main-content {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            width: 100%;
        }
        
        .garden-section {
            flex: 1;
            min-width: 300px;
            max-width: 500px;
            background-color: rgba(255, 255, 255, 0.08);
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .controls-section {
            flex: 1;
            min-width: 300px;
            max-width: 500px;
            background-color: rgba(255, 255, 255, 0.08);
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .section-title {
            font-size: 1.8rem;
            margin-bottom: 20px;
            color: #8bc34a;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        
        .plant-container {
            width: 300px;
            height: 400px;
            position: relative;
            margin: 20px auto;
            display: flex;
            align-items: flex-end;
            justify-content: center;
        }
        
        .plant {
            position: relative;
            transition: all 0.5s ease;
        }
        
        .pot {
            width: 120px;
            height: 100px;
            background: linear-gradient(to right, #795548, #5d4037);
            border-radius: 5px 5px 15px 15px;
            position: relative;
            margin-top: 20px;
        }
        
        .pot-top {
            width: 140px;
            height: 20px;
            background: linear-gradient(to right, #a1887f, #8d6e63);
            border-radius: 10px;
            position: absolute;
            top: -10px;
            left: -10px;
        }
        
        .stem {
            width: 15px;
            background: linear-gradient(to right, #388e3c, #4caf50);
            position: absolute;
            bottom: 100px;
            left: 50%;
            transform: translateX(-50%);
            border-radius: 5px;
            transition: height 1s ease;
        }
        
        .leaf {
            width: 40px;
            height: 25px;
            background: linear-gradient(to right, #8bc34a, #689f38);
            border-radius: 50% 0 50% 50%;
            position: absolute;
            transform-origin: bottom left;
        }
        
        .flower {
            width: 50px;
            height: 50px;
            position: absolute;
            top: -60px;
            left: 50%;
            transform: translateX(-50%);
            opacity: 0;
            transition: opacity 0.8s ease;
        }
        
        .petal {
            width: 20px;
            height: 30px;
            background: linear-gradient(to bottom, #ffeb3b, #fbc02d);
            border-radius: 50%;
            position: absolute;
        }
        
        .center {
            width: 20px;
            height: 20px;
            background: #ff9800;
            border-radius: 50%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        
        .stats {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            width: 100%;
            margin-top: 20px;
        }
        
        .stat {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 15px;
            border-radius: 10px;
            text-align: center;
        }
        
        .stat-value {
            font-size: 1.8rem;
            font-weight: bold;
            color: #4caf50;
            margin-top: 5px;
        }
        
        .stat-name {
            font-size: 0.9rem;
            opacity: 0.8;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
        }
        
        .controls {
            display: flex;
            flex-direction: column;
            gap: 20px;
            margin-top: 20px;
        }
        
        .control-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            justify-content: center;
        }
        
        .control-btn {
            flex: 1;
            min-width: 120px;
            padding: 15px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(to right, #4caf50, #2e7d32);
            color: white;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        
        .control-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            background: linear-gradient(to right, #66bb6a, #388e3c);
        }
        
        .control-btn:active {
            transform: translateY(0);
        }
        
        .control-btn:disabled {
            background: #757575;
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
        }
        
        .mood-tracker {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
        }
        
        .mood-title {
            font-size: 1.2rem;
            margin-bottom: 15px;
            color: #8bc34a;
            text-align: center;
        }
        
        .mood-buttons {
            display: flex;
            justify-content: space-between;
        }
        
        .mood-btn {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
            transition: all 0.3s ease;
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
        }
        
        .mood-btn:hover {
            transform: scale(1.1);
            background-color: rgba(255, 255, 255, 0.2);
        }
        
        .mood-btn.active {
            transform: scale(1.1);
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
        }
        
        .habits {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
        }
        
        .habit {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .habit:last-child {
            border-bottom: none;
        }
        
        .habit-checkbox {
            width: 25px;
            height: 25px;
            border-radius: 50%;
            border: 2px solid #4caf50;
            background-color: transparent;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #4caf50;
        }
        
        .habit-checkbox.checked {
            background-color: #4caf50;
        }
        
        .progress-section {
            width: 100%;
            max-width: 1000px;
            margin-top: 30px;
            background-color: rgba(255, 255, 255, 0.08);
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .progress-bar {
            width: 100%;
            height: 20px;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            margin-top: 10px;
            overflow: hidden;
        }
        
        .progress-fill {
            height: 100%;
            background: linear-gradient(to right, #8bc34a, #4caf50);
            border-radius: 10px;
            width: 0%;
            transition: width 1s ease;
        }
        
        .progress-info {
            display: flex;
            justify-content: space-between;
            margin-top: 5px;
            font-size: 0.9rem;
            opacity: 0.8;
        }
        
        .stage-indicator {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            position: relative;
        }
        
        .stage {
            text-align: center;
            flex: 1;
            position: relative;
            padding-top: 25px;
        }
        
        .stage::before {
            content: '';
            width: 15px;
            height: 15px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.2);
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
        }
        
        .stage.active::before {
            background-color: #4caf50;
            box-shadow: 0 0 10px #4caf50;
        }
        
        .stage.completed::before {
            background-color: #8bc34a;
        }
        
        .notifications {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 100;
        }
        
        .notification {
            background-color: #4caf50;
            color: white;
            padding: 15px 20px;
            border-radius: 10px;
            margin-top: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            display: flex;
            align-items: center;
            gap: 10px;
            transform: translateX(150%);
            transition: transform 0.5s ease;
        }
        
        .notification.show {
            transform: translateX(0);
        }
        
        footer {
            margin-top: 40px;
            text-align: center;
            font-size: 0.9rem;
            opacity: 0.7;
            width: 100%;
            padding: 20px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        @media (max-width: 768px) {
            .main-content {
                flex-direction: column;
                align-items: center;
            }
            
            .garden-section, .controls-section {
                max-width: 100%;
            }
            
            .control-buttons {
                flex-direction: column;
            }
            
            .control-btn {
                min-width: 100%;
            }
            
            h1 {
                font-size: 2.2rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1><i class="fas fa-seedling"></i> Цифровой сад</h1>
            <p class="subtitle">Вырастите своё виртуальное растение, ухаживая за ним каждый день. Поливайте, давайте свет и удобряйте хорошими привычками!</p>
        </header>
        
        <div class="main-content">
            <div class="garden-section">
                <h2 class="section-title"><i class="fas fa-leaf"></i> Ваше растение</h2>
                <div class="plant-container">
                    <div class="plant">
                        <div class="stem" id="stem"></div>
                        <div class="flower" id="flower">
                            <!-- Лепестки будут добавлены через JS -->
                        </div>
                        <div class="pot">
                            <div class="pot-top"></div>
                        </div>
                    </div>
                </div>
                
                <div class="stats">
                    <div class="stat">
                        <div class="stat-name"><i class="fas fa-tint"></i> Вода</div>
                        <div class="stat-value" id="water-value">50%</div>
                    </div>
                    <div class="stat">
                        <div class="stat-name"><i class="fas fa-sun"></i> Свет</div>
                        <div class="stat-value" id="light-value">50%</div>
                    </div>
                    <div class="stat">
                        <div class="stat-name"><i class="fas fa-heart"></i> Здоровье</div>
                        <div class="stat-value" id="health-value">50%</div>
                    </div>
                    <div class="stat">
                        <div class="stat-name"><i class="fas fa-chart-line"></i> Уровень</div>
                        <div class="stat-value" id="level-value">1</div>
                    </div>
                </div>
            </div>
            
            <div class="controls-section">
                <h2 class="section-title"><i class="fas fa-cogs"></i> Уход за растением</h2>
                
                <div class="controls">
                    <div class="control-buttons">
                        <button class="control-btn" id="water-btn">
                            <i class="fas fa-tint"></i> Полить
                        </button>
                        <button class="control-btn" id="light-btn">
                            <i class="fas fa-sun"></i> Дать свет
                        </button>
                        <button class="control-btn" id="fertilize-btn">
                            <i class="fas fa-seedling"></i> Удобрить
                        </button>
                    </div>
                    
                    <div class="mood-tracker">
                        <h3 class="mood-title">Как вы себя чувствуете сегодня?</h3>
                        <div class="mood-buttons">
                            <button class="mood-btn" data-mood="sad">😢</button>
                            <button class="mood-btn" data-mood="neutral">😐</button>
                            <button class="mood-btn active" data-mood="happy">😊</button>
                            <button class="mood-btn" data-mood="excited">🤩</button>
                            <button class="mood-btn" data-mood="love">🥰</button>
                        </div>
                    </div>
                    
                    <div class="habits">
                        <h3 class="mood-title">Полезные привычки (удобряют растение)</h3>
                        <div class="habit">
                            <span>Выпил стакан воды утром</span>
                            <div class="habit-checkbox" data-habit="water"></div>
                        </div>
                        <div class="habit">
                            <span>Сделал зарядку</span>
                            <div class="habit-checkbox" data-habit="exercise"></div>
                        </div>
                        <div class="habit">
                            <span>Прочел 10 страниц книги</span>
                            <div class="habit-checkbox" data-habit="read"></div>
                        </div>
                        <div class="habit">
                            <span>Погулял на свежем воздухе</span>
                            <div class="habit-checkbox" data-habit="walk"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="progress-section">
            <h2 class="section-title"><i class="fas fa-chart-bar"></i> Прогресс роста</h2>
            <div class="progress-bar">
                <div class="progress-fill" id="progress-fill"></div>
            </div>
            <div class="progress-info">
                <span>Текущий прогресс</span>
                <span id="progress-text">0/100</span>
            </div>
            
            <div class="stage-indicator">
                <div class="stage active">Семя</div>
                <div class="stage">Росток</div>
                <div class="stage">Молодое растение</div>
                <div class="stage">Взрослое растение</div>
                <div class="stage">Цветущее растение</div>
            </div>
        </div>
        
        <div class="notifications" id="notifications">
            <!-- Уведомления будут добавляться через JS -->
        </div>
        
        <footer>
            <p>Ваш цифровой сад хранится в localStorage браузера. Все данные остаются на вашем устройстве.</p>
            <p>Посещайте сайт каждый день, чтобы растение росло и процветало!</p>
        </footer>
    </div>

    <script>
        // Инициализация состояния растения
        let plantState = {
            water: 50,
            light: 50,
            health: 50,
            level: 1,
            xp: 0,
            xpNeeded: 100,
            lastVisit: Date.now(),
            mood: 'happy',
            habits: {
                water: false,
                exercise: false,
                read: false,
                walk: false
            },
            growthStage: 0 // 0: семя, 1: росток, 2: молодое, 3: взрослое, 4: цветущее
        };

        // Элементы DOM
        const waterValueEl = document.getElementById('water-value');
        const lightValueEl = document.getElementById('light-value');
        const healthValueEl = document.getElementById('health-value');
        const levelValueEl = document.getElementById('level-value');
        const progressFillEl = document.getElementById('progress-fill');
        const progressTextEl = document.getElementById('progress-text');
        const stemEl = document.getElementById('stem');
        const flowerEl = document.getElementById('flower');
        const notificationsEl = document.getElementById('notifications');
        
        // Кнопки действий
        const waterBtn = document.getElementById('water-btn');
        const lightBtn = document.getElementById('light-btn');
        const fertilizeBtn = document.getElementById('fertilize-btn');
        
        // Кнопки настроения
        const moodButtons = document.querySelectorAll('.mood-btn');
        
        // Чекбоксы привычек
        const habitCheckboxes = document.querySelectorAll('.habit-checkbox');
        
        // Стадии роста
        const stages = document.querySelectorAll('.stage');
        
        // Загрузка состояния из localStorage
        function loadPlantState() {
            const savedState = localStorage.getItem('digitalGarden');
            if (savedState) {
                const parsedState = JSON.parse(savedState);
                plantState = {...plantState, ...parsedState};
                
                // Проверяем, сколько времени прошло с последнего посещения
                const timePassed = Date.now() - plantState.lastVisit;
                const hoursPassed = timePassed / (1000 * 60 * 60);
                
                // Если прошло более 3 часов, уменьшаем показатели
                if (hoursPassed > 3) {
                    const decay = Math.min(hoursPassed / 24, 1); // Максимальное уменьшение 50%
                    plantState.water = Math.max(0, plantState.water - (30 * decay));
                    plantState.light = Math.max(0, plantState.light - (30 * decay));
                    plantState.health = Math.max(0, plantState.health - (20 * decay));
                    
                    showNotification('Ваше растение соскучилось по вам! Показатели немного упали.', 'warning');
                }
                
                plantState.lastVisit = Date.now();
            }
            
            updateUI();
        }
        
        // Сохранение состояния в localStorage
        function savePlantState() {
            localStorage.setItem('digitalGarden', JSON.stringify(plantState));
        }
        
        // Обновление интерфейса
        function updateUI() {
            // Обновляем значения
            waterValueEl.textContent = `${Math.round(plantState.water)}%`;
            lightValueEl.textContent = `${Math.round(plantState.light)}%`;
            healthValueEl.textContent = `${Math.round(plantState.health)}%`;
            levelValueEl.textContent = plantState.level;
            
            // Обновляем прогресс
            const progressPercent = (plantState.xp / plantState.xpNeeded) * 100;
            progressFillEl.style.width = `${progressPercent}%`;
            progressTextEl.textContent = `${Math.round(plantState.xp)}/${plantState.xpNeeded}`;
            
            // Обновляем стадии роста
            updateGrowthStage();
            
            // Обновляем внешний вид растения
            updatePlantAppearance();
            
            // Обновляем активные кнопки настроения
            moodButtons.forEach(btn => {
                if (btn.dataset.mood === plantState.mood) {
                    btn.classList.add('active');
                } else {
                    btn.classList.remove('active');
                }
            });
            
            // Обновляем чекбоксы привычек
            habitCheckboxes.forEach(checkbox => {
                const habit = checkbox.dataset.habit;
                if (plantState.habits[habit]) {
                    checkbox.classList.add('checked');
                    checkbox.innerHTML = '✓';
                } else {
                    checkbox.classList.remove('checked');
                    checkbox.innerHTML = '';
                }
            });
            
            // Сохраняем состояние
            savePlantState();
        }
        
        // Обновление стадии роста
        function updateGrowthStage() {
            const stage = plantState.growthStage;
            
            stages.forEach((stageEl, index) => {
                stageEl.classList.remove('active', 'completed');
                
                if (index === stage) {
                    stageEl.classList.add('active');
                } else if (index < stage) {
                    stageEl.classList.add('completed');
                }
            });
        }
        
        // Обновление внешнего вида растения
        function updatePlantAppearance() {
            // Высота стебля зависит от уровня
            const stemHeight = 50 + (plantState.level * 20);
            stemEl.style.height = `${stemHeight}px`;
            
            // Цвет стебля зависит от здоровья
            const healthPercent = plantState.health / 100;
            const greenValue = Math.round(56 + (healthPercent * 100));
            stemEl.style.background = `linear-gradient(to right, #388e3c, rgb(${greenValue}, ${180 + greenValue/2}, ${100 + greenValue/3}))`;
            
            // Показываем цветок только на 4-й стадии роста
            if (plantState.growthStage >= 4) {
                flowerEl.style.opacity = '1';
                
                // Очищаем предыдущие лепестки
                flowerEl.innerHTML = '';
                
                // Добавляем лепестки
                const petalColors = ['#ffeb3b', '#fbc02d', '#ff9800', '#f57c00'];
                for (let i = 0; i < 8; i++) {
                    const petal = document.createElement('div');
                    petal.className = 'petal';
                    petal.style.transform = `rotate(${i * 45}deg) translateX(25px)`;
                    petal.style.background = `linear-gradient(to bottom, ${petalColors[i % 4]}, ${petalColors[(i + 1) % 4]})`;
                    flowerEl.appendChild(petal);
                }
                
                // Добавляем центр цветка
                const center = document.createElement('div');
                center.className = 'center';
                flowerEl.appendChild(center);
            } else {
                flowerEl.style.opacity = '0';
            }
            
            // Добавляем листья на более высоких уровнях
            const leavesContainer = document.querySelectorAll('.leaf');
            leavesContainer.forEach(leaf => leaf.remove());
            
            if (plantState.level >= 2) {
                for (let i = 0; i < plantState.level; i++) {
                    const leaf = document.createElement('div');
                    leaf.className = 'leaf';
                    
                    // Позиционируем листья на стебле
                    const leafHeight = 30 + (i * 15);
                    leaf.style.bottom = `${100 + leafHeight}px`;
                    leaf.style.left = `${50 + (i % 2 === 0 ? 10 : -10)}%`;
                    leaf.style.transform = `rotate(${i % 2 === 0 ? 30 : -30}deg)`;
                    
                    // Цвет листьев зависит от воды
                    const waterPercent = plantState.water / 100;
                    const leafGreen = Math.round(139 + (waterPercent * 50));
                    leaf.style.background = `linear-gradient(to right, #8bc34a, rgb(${leafGreen}, ${195 + leafGreen/2}, ${74 + leafGreen/3}))`;
                    
                    stemEl.parentNode.insertBefore(leaf, stemEl.nextSibling);
                }
            }
        }
        
        // Полив растения
        function waterPlant() {
            if (plantState.water >= 100) {
                showNotification('Растение уже достаточно полито!', 'info');
                return;
            }
            
            plantState.water = Math.min(100, plantState.water + 15);
            plantState.health = Math.min(100, plantState.health + 5);
            addXP(10);
            
            showNotification('Вы полили растение! +10 опыта', 'success');
            updateUI();
        }
        
        // Дать свет растению
        function giveLight() {
            if (plantState.light >= 100) {
                showNotification('Растение уже получило достаточно света!', 'info');
                return;
            }
            
            plantState.light = Math.min(100, plantState.light + 15);
            plantState.health = Math.min(100, plantState.health + 5);
            addXP(10);
            
            showNotification('Вы дали свет растению! +10 опыта', 'success');
            updateUI();
        }
        
        // Удобрить растение (выполненные привычки)
        function fertilizePlant() {
            const completedHabits = Object.values(plantState.habits).filter(v => v).length;
            
            if (completedHabits === 0) {
                showNotification('Сначала выполните хотя бы одну привычку!', 'warning');
                return;
            }
            
            plantState.health = Math.min(100, plantState.health + (completedHabits * 10));
            addXP(completedHabits * 15);
            
            // Сбрасываем привычки после удобрения
            for (let habit in plantState.habits) {
                plantState.habits[habit] = false;
            }
            
            showNotification(`Вы удобрили растение ${completedHabits} привычками! +${completedHabits * 15} опыта`, 'success');
            updateUI();
        }
        
        // Добавление опыта и проверка уровня
        function addXP(amount) {
            plantState.xp += amount;
            
            // Проверяем, достигнут ли новый уровень
            if (plantState.xp >= plantState.xpNeeded) {
                plantState.level++;
                plantState.xp = plantState.xp - plantState.xpNeeded;
                plantState.xpNeeded = Math.round(plantState.xpNeeded * 1.5);
                
                // Обновляем стадию роста каждые 2 уровня
                if (plantState.level % 2 === 0 && plantState.growthStage < 4) {
                    plantState.growthStage++;
                }
                
                showNotification(`Поздравляем! Ваше растение достигло ${plantState.level} уровня!`, 'level-up');
            }
        }
        
        // Установка настроения
        function setMood(mood) {
            plantState.mood = mood;
            
            // Настроение влияет на здоровье растения
            const moodEffects = {
                sad: -5,
                neutral: 0,
                happy: 5,
                excited: 10,
                love: 15
            };
            
            plantState.health = Math.min(100, Math.max(0, plantState.health + moodEffects[mood]));
            
            showNotification(`Вы установили настроение: ${getMoodText(mood)}. Влияние на растение: ${moodEffects[mood] > 0 ? '+' : ''}${moodEffects[mood]} к здоровью`, 'info');
            updateUI();
        }
        
        // Получение текстового описания настроения
        function getMoodText(mood) {
            const moodTexts = {
                sad: 'Грусть',
                neutral: 'Нейтральное',
                happy: 'Счастье',
                excited: 'Восхищение',
                love: 'Любовь'
            };
            
            return moodTexts[mood];
        }
        
        // Переключение привычки
        function toggleHabit(habit) {
            plantState.habits[habit] = !plantState.habits[habit];
            updateUI();
        }
        
        // Показать уведомление
        function showNotification(message, type) {
            const notification = document.createElement('div');
            notification.className = `notification ${type}`;
            
            // Иконка в зависимости от типа уведомления
            let icon = 'fa-info-circle';
            if (type === 'success') icon = 'fa-check-circle';
            if (type === 'warning') icon = 'fa-exclamation-triangle';
            if (type === 'level-up') icon = 'fa-star';
            
            notification.innerHTML = `
                <i class="fas ${icon}"></i>
                <span>${message}</span>
            `;
            
            notificationsEl.appendChild(notification);
            
            // Показываем уведомление
            setTimeout(() => {
                notification.classList.add('show');
            }, 10);
            
            // Убираем уведомление через 5 секунд
            setTimeout(() => {
                notification.classList.remove('show');
                setTimeout(() => {
                    if (notification.parentNode) {
                        notification.parentNode.removeChild(notification);
                    }
                }, 500);
            }, 5000);
        }
        
        // Инициализация событий
        function initEvents() {
            waterBtn.addEventListener('click', waterPlant);
            lightBtn.addEventListener('click', giveLight);
            fertilizeBtn.addEventListener('click', fertilizePlant);
            
            moodButtons.forEach(btn => {
                btn.addEventListener('click', () => {
                    setMood(btn.dataset.mood);
                });
            });
            
            habitCheckboxes.forEach(checkbox => {
                checkbox.addEventListener('click', () => {
                    toggleHabit(checkbox.dataset.habit);
                });
            });
            
            // Показываем приветственное сообщение при первом посещении
            if (!localStorage.getItem('digitalGarden')) {
                setTimeout(() => {
                    showNotification('Добро пожаловать в ваш цифровой сад! Посадите семя, ухаживая за ним каждый день.', 'info');
                }, 1000);
            }
        }
        
        // Инициализация приложения
        function initApp() {
            loadPlantState();
            initEvents();
            
            // Автоматическое уменьшение показателей со временем (каждые 30 секунд для демонстрации)
            setInterval(() => {
                plantState.water = Math.max(0, plantState.water - 0.5);
                plantState.light = Math.max(0, plantState.light - 0.5);
                
                // Здоровье ухудшается, если вода или свет ниже 20
                if (plantState.water < 20 || plantState.light < 20) {
                    plantState.health = Math.max(0, plantState.health - 0.3);
                }
                
                updateUI();
            }, 30000); // 30 секунд
        }
        
        // Запуск приложения
        document.addEventListener('DOMContentLoaded', initApp);
    </script>
</body>
</html>
