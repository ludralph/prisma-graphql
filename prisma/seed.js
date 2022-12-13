const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()

async function main() {
  await prisma.school.create({
    data: {
      name: 'School 1',
      center_no: 123456,
      type: 'gov',
      subjects: {
        create: [
          {
            name: 'Math',
            code: 'MATH',
          },
          {
            name: 'Science',
            code: 'SCI',
          },
        ],
      },
    },
  });
  console.log(school, { depth: Infinity })
  console.log

}
main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })