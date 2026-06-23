-- CreateEnum
CREATE TYPE "Role" AS ENUM ('SUPER_ADMIN', 'ADMIN', 'DATA_ADMIN', 'ALUMNI');

-- CreateEnum
CREATE TYPE "EmploymentType" AS ENUM ('JOB', 'BUSINESS', 'SELF_EMPLOYED', 'AGRICULTURE', 'UNEMPLOYED');

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'ALUMNI',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Alumni" (
    "id" SERIAL NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "entryBatchYear" INTEGER NOT NULL,
    "passOutBatchYear" INTEGER NOT NULL,
    "rollNumber" TEXT,
    "houseNumber" TEXT,
    "employmentType" "EmploymentType" NOT NULL,
    "currentCompany" TEXT,
    "sector" TEXT,
    "countryCode" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "alternateName" TEXT,
    "alternatePhone" TEXT,
    "permanentAddress" JSONB NOT NULL,
    "currentAddress" JSONB NOT NULL,
    "photoUrl" TEXT,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Alumni_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Alumni_userId_key" ON "Alumni"("userId");

-- AddForeignKey
ALTER TABLE "Alumni" ADD CONSTRAINT "Alumni_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
