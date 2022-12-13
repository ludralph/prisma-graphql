// 1
const { PrismaClient, Prisma } = require("@prisma/client")


// 2
const prisma = new PrismaClient(
  {
    log: ['query'],
  }
)


// 3
async function main() {
  
  const res = await prisma.lien.create({
    data: {
      name: 'Lien Name 3',
      lienHolderLetter: {
        create: {
          name: 'Lien holder letter document 2',
          Lien_finalLienReceived: {
            create: [{ name: 'Final Lien Received 2' }]
          }
        }
      }
      
    }
  });
  
 
  console.dir(res, { depth: Infinity })
  // console.log(res.length)
}

// 4
main()
  .catch(e => {
    throw e
  })
  // 5
  .finally(async () => {
    await prisma.$disconnect()
  })