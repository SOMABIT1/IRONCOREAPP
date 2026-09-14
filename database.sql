-- ESTRUCTURA SQL BÁSICA PARA IRONCORE AI FITNESS (PostgreSQL)

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(100),
    gender CHAR(1),
    date_of_birth DATE,
    height_cm DECIMAL(5,2),
    weight_kg DECIMAL(5,2),
    activity_level VARCHAR(50),
    goal VARCHAR(50),
    subscription_plan VARCHAR(20) DEFAULT 'FREE', -- FREE, PRO, PREMIUM
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE workouts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id),
    title VARCHAR(100),
    type VARCHAR(50), -- HIPERTROFIA, FUERZA, CARDIO
    ai_generated BOOLEAN DEFAULT FALSE,
    scheduled_for DATE,
    completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE exercises (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100),
    muscle_group VARCHAR(50),
    equipment_required VARCHAR(50),
    video_url VARCHAR(255)
);

CREATE TABLE workout_sets (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    workout_id UUID REFERENCES workouts(id),
    exercise_id UUID REFERENCES exercises(id),
    set_number INT,
    reps INT,
    weight_kg DECIMAL(5,2),
    rpe INT, -- Rate of Perceived Exertion
    is_pr BOOLEAN DEFAULT FALSE
);

CREATE TABLE nutrition_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id),
    log_date DATE,
    meal_type VARCHAR(20), -- DESAYUNO, ALMUERZO, ETC
    food_name VARCHAR(100),
    calories INT,
    protein_g DECIMAL(5,2),
    carbs_g DECIMAL(5,2),
    fats_g DECIMAL(5,2),
    ai_scanned BOOLEAN DEFAULT FALSE
);

CREATE TABLE social_posts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id),
    content TEXT,
    image_url VARCHAR(255),
    likes_count INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
