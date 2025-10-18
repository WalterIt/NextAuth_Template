-- ============================================
-- 1️⃣ Create Enums
-- ============================================
DROP TYPE IF EXISTS "UserRole";
CREATE TYPE "UserRole" AS ENUM ('ADMIN', 'USER');

-- ============================================
-- 2️⃣ Create Tables
-- ============================================
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "email" TEXT,
    "email_verified" TIMESTAMP(3),
    "image" TEXT,
    "password" TEXT,
    "role" "UserRole" NOT NULL DEFAULT 'USER',
    "isTwoFactorEnabled" BOOLEAN NOT NULL DEFAULT false,
    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "accounts" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "provider_account_id" TEXT NOT NULL,
    "refresh_token" TEXT,
    "access_token" TEXT,
    "expires_at" INTEGER,
    "token_type" TEXT,
    "scope" TEXT,
    "id_token" TEXT,
    "session_state" TEXT,
    CONSTRAINT "accounts_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "VerificationToken" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "VerificationToken_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "ResetPasswordToken" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "ResetPasswordToken_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "TwoFactorToken" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "TwoFactorToken_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "TwoFactorConfirmation" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    CONSTRAINT "TwoFactorConfirmation_pkey" PRIMARY KEY ("id")
);

-- ============================================
-- 3️⃣ Create Indexes
-- ============================================
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

CREATE UNIQUE INDEX "accounts_provider_provider_account_id_key" 
ON "accounts"("provider", "provider_account_id");

CREATE UNIQUE INDEX "VerificationToken_token_key" 
ON "VerificationToken"("token");

CREATE UNIQUE INDEX "VerificationToken_email_token_key" 
ON "VerificationToken"("email", "token");

CREATE UNIQUE INDEX "ResetPasswordToken_token_key" 
ON "ResetPasswordToken"("token");

CREATE UNIQUE INDEX "ResetPasswordToken_email_token_key" 
ON "ResetPasswordToken"("email", "token");

CREATE UNIQUE INDEX "TwoFactorToken_token_key" 
ON "TwoFactorToken"("token");

CREATE UNIQUE INDEX "TwoFactorToken_email_token_key" 
ON "TwoFactorToken"("email", "token");

CREATE UNIQUE INDEX "TwoFactorConfirmation_userId_key" 
ON "TwoFactorConfirmation"("userId");

-- ============================================
-- 4️⃣ Add Foreign Keys (AFTER tables and indexes)
-- ============================================
ALTER TABLE "accounts" 
ADD CONSTRAINT "accounts_user_id_fkey" 
FOREIGN KEY ("user_id") REFERENCES "users"("id") 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "TwoFactorConfirmation" 
ADD CONSTRAINT "TwoFactorConfirmation_userId_fkey" 
FOREIGN KEY ("userId") REFERENCES "users"("id") 
ON DELETE CASCADE ON UPDATE CASCADE;
