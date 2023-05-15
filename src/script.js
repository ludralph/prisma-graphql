// 1
const { PrismaClient, Prisma } = require("@prisma/client")
// const { getDMMF } = require('@prisma/sdk');
// const { exec } = require('child_process');
// const ObjectID = require('bson').ObjectID;
// const { BSON, EJSON, ObjectId } = require('bson');
const dayjs = require('dayjs')


// 2
const prisma = new PrismaClient(
  {
    log: ['query'],
  }
)


// 3
async function main() {
// const coins = [
//   { name: "USD", data: { price: 1000, volume: 1000 } },
//   { name: "EUR", data: { price: 1000, volume: 1000 } },
// ];

// const query = Prisma.sql`INSERT INTO coin_prices (coin, data)
//       VALUES ${Prisma.join(coins.map((coin) => Prisma.sql`($Prisma.join(coin.name, JSON.stringify(coin.data))`))}
//       ON CONFLICT (coin) DO UPDATE SET data = EXCLUDED.data;`;

//  const res = await prisma.$executeRaw(query);
// const data = await prisma.properties.findMany()

// Create a Category
// const newCategory = await prisma.category.create({
//   data: {
//     name: "Travel"
//   }
// });

// // Create an Expense
// const newExpense = await prisma.expense.create({
//   data: {
//     amount: 500,
//     desc: "Airfare",
//     categoriesOnExpenses: {
//       create: {
//         category: {
//           connect: {
//             id: newCategory.id
//           }
//         }
//       }
//     }
//   }
// });

// console.dir(`Created Category:`, newCategory, { depth: Infinity });
// console.log(`Created Expense:`, newExpense, { depth: Infinity });

// const res = await prisma.category.findMany({
//   include:{
//     categoriesOnExpenses:{
//       include:{
//         expense: true
//       }
//     }
//   }
// });

// const specificDate = new Date("2023-02-09T08:32:42.766Z");

// const categories = await prisma.category.findMany({
//   include: {
//     categoriesOnExpenses: {
//       include: {
//         expense: {
//           select: {
//             id: true,
//             createdAt: true,
//             amount: true,
//             desc: true
//           }
//         }
//       }
//     }
//   }
// });

// // console.log(categories[0].categoriesOnExpenses)

// const categoriesWithExpenses = categories.filter(category => {
//   return category.categoriesOnExpenses.some(coe => {
//     return coe.expense.createdAt.getTime() === specificDate.getTime();
//   });
// });

// const res = await prisma.user.create({
//   data:{
//     email: "test2@test.com",
//     name: "Ralph",
//     posts: {
//       create:{
//         title: "First post",
//         content: "First content"
//       }
//     }
//   }
// })


// const userAndTeam = await prisma.usersInTeams.findFirst({
//   where: {
//     userId: 'cle2mynwy0000x5sfq7xrxs4t',
//     teamId: 'cle2mynwz0001x5sfcyttspmm'
//   },
//   include: {
//     user:{
//       select:{
//         email: true
//       }
//     }
//   }
// })

// const res = await prisma.test.findMany({
//   take: 1
// })

// const res = await prisma.category.create({
//   data:{
//     name: "Third Cat",
//     expenses: {
//       create: {
//         amount: 1500,
//         createdAt: new Date()
//       }
//     }
//   }
// })

// const categories = await prisma.category.findMany({
//   where: {
//     expenses: {
//       some: {
//         createdAt: {
//           gt: new Date('2023-02-01T00:00:00.000Z').toISOString(),
//           lt: new Date('2023-03-01T00:00:00.000Z').toISOString(),
//         }
//       }
//     }
//   },
//   include: {
//     expenses: true,
//   },
//   take: 150, // optional limit to the number of returned Categories
// });

// await prisma.$transaction(async (tx) => {
//   const txId = await prisma.$executeRaw`SELECT txid_current()`;
//   console.log('Transaction ID:', txId);
// });
//console.dir(categories, { depth: Infinity })
  // console.dir(res, { depth: Infinity })
//   // console.log(res.length)

  // const res = await prisma.post.create({
  //   data:{
  //     text: "Yet Yet Another Random imaginative text",
  //     userId: 1
  //   }
  // })

//   const res = await prisma.product.create({
//     data:{
//       total: 1000,
//       available: 800
//     }
//   })

//  const res1 = await prisma.product.findMany();

//   const xprisma = prisma.$extends({
//     result: {
//       product: {
//         save: {
//           needs: { total: true, available: true },
//           compute(product) {
//             return () =>
//               prisma.product.findFirst({ where: { available: { gte: product.total * 0.8 }}})
//           },
//         },
//       },
//     },
    
//   })

// const res = await xprisma.product.findFirst({ take: 1});
//  console.log('PPP ', await  res.save())
//console.log("KKK ", await res.save())

// const newSong = await prisma.song.create({
//   data: {
//     spotify_id: 'song_spotify_id6',
//     explicit: false,
//     name: 'New Song',
//     popularity: 50,
//     preview_url: 'https://example.com',
//     track_number: 1,
//     external_url: 'https://example.com',
//     feeds: {
//       create: {
//         userId: 'user_id',
//         hasInteracted: false,
//       }
//     }
//   },
//   include: {
//     feeds: true,
//   },
// });
  
// const paginate = async () => {
 
//   const limit = 3;
//   // const { cursor, skip } = input;
//   const items = await prisma.feedSong.findMany({
//     where: {
//       hasInteracted: false,
//       added: { gt: '2023-02-23T11:42:02.466Z'}
//     },
//     take: 4,
//     skip: 1,
//     // include: {
//     //   song: {
//     //     include: basicIncludeForSong(ctx.session.user.id),
//     //   },
//     // },
//     orderBy: {
//       added: "desc",
//     },
//   });
  
//   let nextCursor = undefined;
 
//   if (items.length > limit) {
//     nextCursor = items[limit - 1].added.toISOString();
//   }
  
//   return {
//     items,
//     nextCursor,
//   };
  
// }

// console.log(await paginate())

  // const products = await db.product.findMany({
  //   where: {
  //     available: { gte: db.product.fields.total * 0.8 } // not working
  //   }
  // });
 
   // console.dir(res, { depth: Infinity})
  

  // const userIds = [1,2,3]
  // await prisma.$transaction(
  //   userIds.map((userId) =>
  //     prisma.post.findMany({
  //       where: { userId },
  //       take: 5,
  //       orderBy: { createdAt: 'desc' },
  //     })
  //   )
  // ).then(res => console.log(res.flat()));

  // const newSong = await prisma.song.update({
  //   where: { spotify_id: 'song_spotify_id5'},
  //   data: { name: "Another new Song" },
  //  select:null
  // })
//   const select = `"Song".name`
// const page = await prisma.$queryRawUnsafe(`SELECT ${select} from "Song" LIMIT 1`)

// let date = new Date()
//   date.setHours(9)
//   date.setMinutes(0)
//   date.setSeconds(0)

// let date2 = new Date()
// date.setHours(10)
// date.setMinutes(0)
// date.setSeconds(0)


// const data = await prisma.group.findMany({
//   where: {
//     time: {
//       gte: date,
//       lt:  date2
//     },
//   },
// });

// const data = await prisma.projects.create({
//   data: {
//     name: "Test project2",
//     Tasks:{
//       create:{
//         title: "first task of test project 2",
//         description: "test description of test project 2",
//         completedDateTime: new Date(),
//         priority: 3,
//         completed: true,
//       }
//     },
    
//   }
// })

// const data = await prisma.t.findMany({
// })
// const query = Prisma.sql`SELECT "Projects"."id", "Projects"."name", count("Tasks"."projectId") AS cnt
// FROM "Projects"
// LEFT OUTER JOIN "Tasks" ON "Projects"."id" = "Tasks"."projectId"
// GROUP BY "Projects"."id"`
// const result = await prisma.$queryRaw`${query}` 
 // console.dir(res ,{ depth: Infinity } )

//  const res = await prisma.task.create({
//   data: {
//     title: "testing",
//     updatedAt: new Date()
//   }
//  })
//  console.log("result", res)



// const res =  await prisma.account.create({
//   data: {
//     orderNum: "JOUR-22/23-3"
//   }
// })
// const orders = await prisma.account.findMany({
//   where: { orderNum: { startsWith: 'JOUR' } }
// });

// // console.dir(orders ,{ depth: Infinity } )

// const updateOperations = orders.map(order => ({
//   // where: { id: order.id },
//   orderNum: order.orderNum.replace('JOUR', 'JOR') 
// }));
// console.dir( updateOperations ,{ depth: Infinity } )
// const res = await prisma.account.updateMany({
//   data: updateOperations
// });
//   const device = {
//     parts : [
//       {
//         partNumber: '123',
//         quantity: 1,
//         partName: 'Part A'
//       },
//       {
//         partNumber: '456',
//         quantity: 2,
//         partName: 'Part B'
//       }
//     ]
//   }
 
// const newDevice = await prisma.deviceModel.create({
//   data: {
//     modelNumber: 'A123456',
//     parts: {
//       set: device.parts
//     }
//   }
// })

//await prisma.deviceModel.create({
//   data: {
//     modelNumber: "A123",
//     parts: {
//       create: [
//         {
//           partNumber: '123',
//           quantity: 1,
//           partName: 'Part A',
//         },
//         {
//           partNumber: '456',
//           quantity: 2,
//           partName: 'Part B',
//         },
//       ],
//     },
//   },
// })
// const res = await prisma.products.create({
//   data: {
//     name: 'Product Name',
//     sku: 'SKU123',
//     price: 9.99,
//     description: 'Product Description',
//     files: {
//       create: [
//         {
//           Product_Files: {
//             create: {
//               Files: {
//                 create: {
//                   name: 'File 1',
//                   type: 'image/png',
//                   url: 'https://example.com/file1.png'
//                 }
//               }
//             }
//           }
//         },
//         {
//           Product_Files: {
//             create: {
//               Files: {
//                 create: {
//                   name: 'File 2',
//                   type: 'image/jpeg',
//                   url: 'https://example.com/file2.jpg'
//                 }
//               }
//             }
//           }
//         }
//       ]
//     }
//   }
// });
//  const socialIdentity = await prisma.socialIdentity.findFirst()
 


// const share = await prisma.share.create({
//   data: {
    
//     socialIdentityId: socialIdentity.id || undefined
//   },
// });

// const productsWithFiles = await prisma.products.create({
//   data: {
//     sku: 'sku101',
//     name:'dietary foods',
//     price: 50.99,
//     description: 'First Product',
//     files:{
//       create: [
//         {
//           Files: {
//             create: {
//               name: 'Product1',
//               type: 'image',
//               url: "Iimage1"
//             }
//           }
//         }
//       ]
//     }
// },
// }
// )
// const productsWithFiles = await prisma.products.create({
//   data: {
//     sku: 'sku102',
//     name: 'dietary foods',
//     price: 60.99,
//     description: 'Second Product',
//     files: {
//       create: [
//         {
//           Files: {
//             create: {
//               name: 'Product1',
//               type: 'image',
//               url: 'Iimage1'
//             }
//           },
          
//         }
//       ]
//     }
//   }
// });

// const file = [
//   { id: 1 },
//   // { id: 2 },
//   // { id: 3 },
// ];

// const selectedFiles = [
//   { id: 1 },
//   // { id: 2 },
//   // { id: 3 },
// ];

// const res = await prisma.$transaction([
//   prisma.product_Files.deleteMany({
//     where: {
//       product_id: 1,
//       file_id: {
//         notIn: selectedFiles.map((file) => file.id),
//       },
//     },
//   }),
//   prisma.products.update({
//     where: {
//       id: 1,
//     },
//     data: {
//       name:"ABC",
//       files: {
//         set: selectedFiles.map((file) => ({ id: file.id })),
//       },
//       // sku,
//       // description,
//       // category_id: parseInt(category_id),
//     },
//   }),
// ]);

// const newImageGrid = await prisma.imageGrid.create({
//   data: {
//       images: {
//           create: {
//               image: {
//                   create: {
//                       url: 'https://example.com/image2.jpg'
//                   }
//               },
//               order: 2 // Add the order field with a value of 0 or any other integer value
//           }
//       }
//   },
//   include: {
//       images: {
//           select: {
//               image: true
//           }
//       }
//   }
// });

// const imageGrids = await prisma.imageGrid.findMany({
//   include: {
//       images: {
//           select: {
//               image: {
//                   select: {
//                       id: true,
//                       url: true
//                   }
//               },
//               order: true
//           },
//           orderBy: {
//               order: "asc"
//           }
//       }
//   }
// });

// const flattenedImageGrids = await prisma.$queryRaw`
//     SELECT
//         json_agg(
//             json_build_object(
//                 'id', i.id,
//                 'url', i.url
//             ) ORDER BY iig.order ASC
//         ) AS "images"
//     FROM
//         imagegrid ig
//         LEFT JOIN "ImageOnImageGrid" iig ON iig.imagegridid = ig.id
//         LEFT JOIN image i ON iig.imageid = i.id
//     GROUP BY
//         ig.id
// `;

// Create the two rooms that will be connected
// const room1 = await prisma.room.create({
//   data: {
//     name: "Room 1",
//   },
// });

// console.log(room1);

// const room2 = await prisma.room.create({
//   data: {
//     name: "Room 2",
//   },
// });

// console.log(room2);

// // Create a new RoomConnection object that connects the two rooms
// const connection = await prisma.roomConnection.create({
//   data: {
//     connection: "Connection 1",
//     rooms: {
//       connect: [
//         { id: room1.id },
//         { id: room2.id },
//       ],
//     },
//   },
// });

// console.log(connection)

// // Add the new RoomConnection object to each of the rooms' connections and connectedTo fields
// const res1 = await prisma.room.update({
//   where: { id: room1.id },
//   data: {
//     connections: { connect: { id: connection.id } },
//     connectedTo: { connect: { id: connection.id } },
//   },
// });
// console.log('res1 = ', res1)
// const res2 = await prisma.room.update({
//   where: { id: room2.id },
//   data: {
//     connections: { connect: { id: connection.id } },
//     connectedTo: { connect: { id: connection.id } },
//   },
// });



//  console.dir(res2 ,{ depth: Infinity } )
// async function getConnectedRooms(roomId) {
//   const room = await prisma.room.findUnique({
//     where: { id: roomId },
//     include: {
//       connections: {
//         include: {
//           connectedTo: true
//         },
//       },
//     },
//   });
//  console.dir( room, { depth: Infinity } )
//   if (!room) {
//     throw new Error(`No room found with ID ${roomId}`);
//   }

//   // const connectedRooms = room.connections.reduce((acc, conn) => {
//   //   const connRooms = conn.connectedTo.map((c) => c.RoomConnectionLink.room);
//   //   return [...acc, ...connRooms];
//   // }, []);

//   return room;
// }

// // Usage example
// const connectedRooms = await getConnectedRooms('204cf1e5-2dc1-4b16-9d14-23e59522d2fc');
// console.log(connectedRooms);



// Replace `path/to/prisma/schema.prisma` with the path to your Prisma schema file
//const prismaSchemaPath = 'path/to/prisma/schema.prisma';

// exec(`npx prisma db push`, (error, stdout, stderr) => {
//   if (error) {
//     console.error(`Database push error: ${error.message}`);
//     return;
//   }
//   if (stderr) {
//     console.error(`Database push stderr: ${stderr}`);
//     return;
//   }
//   console.log(`Database push stdout: ${stdout}`);
// });
//console.log(new ObjectId('4edd40c86762e0fb12000003'))

// const res = await prisma.users.create({
//   data:{
//     id: new ObjectId('4edd40c86762e0fb12000003'),
//     email: "test@gmail.com",
//     name: "test name"
//   }
// })

// const res = await prisma.user.create({
//   data: {
//     email: 'user@example.com',
//     password: "testpass",
//     roletype: [UserRoleType.ADMIN, UserRoleType.USER],
//   },
// });
// const contextBuffer = Buffer.from([1, 2, 3, 4]);

// const emailTemplate = await prisma.emailTemplate.create({
//   data: {
//     name: '123211',
//     subject: 'subject',
//     context: contextBuffer,
//     status: 0,
//     serviceId: 1,
//     type: 2,
//   },
//   select: {
//     id: true,
//     name: true,
//     subject: true,
//     context: true,
//     status: true,
//     serviceId: true,
//   },
// });


// const res = await prisma.pCB.create({
//   data: {
//     name: "name of Pcb1",
//     resistors: {
//       create: {
//         quantity: 10,
//         resistor: {
//           connectOrCreate: {
//             where: {
//               value: 100,
//             },
//             create: {
//               value: 100,
//             },
//           },
//         },
//       },
//     },
//   },
// });

// const pcb = {
//   name: "My PCB",
//   resistors: [
//     { value: 100, quantity: 10, resistorId: 1 },
//     { value: 220, quantity: 5, resistorId: 2 },
//     { value: 330, quantity: 2, resistorId: 3 },
//   ],
// };

// const res = await prisma.pCB.create({
//   data:{
//     name: pcb.name,
//     resistors: {
//       create: {
        
//       }
//     }
//   }
// })


// const newUser = await prisma.user.create({
//   data: {
//     email: 'jane.doe@example.com',
//     profile: {
//       create: {
//         // firstName: 'Jane',
//         // lastName: 'Doe',
//         // bio: 'Hello, I am Jane!'
//       }
//     }
//   },
//   include: {
//     profile: true // include the created profile in the response
//   }
// });

// const res  = await prisma.a.create({
//   data: {
//     B: {
//       create: [
//         { success: false },
//         { success: false },
//         { success: false },
//       ],
//     },
//   },
//   include: {
//     B: true,
//   },
// });

// const res = await prisma.a.findMany({
//   include:{
//     B: true
//   }
// })

// const res = await prisma.a.findFirst({
//   where: {
//     id: 1,
//     B: {
//       every: {
//         success: true
//       }
//     }
//   },
//   orderBy: {
//     id: 'desc'
//   },
//   include: {
//     B: true
//   }
// });

// const res = await prisma.a.findFirst({
//   where: {
//     id: 4,
//     B: {
//       some: {
//         success: true
//       }
//     }
//   },
//   orderBy: {
//     B: {
//       id: 'desc'
//     }
//   },
//   take: 1,
//   include: {
//     B: true
//   }
// });
// const res = await prisma.a.findUnique({
//   where: {
//     id: 2,
//   },
//   include:{
//     B: {
//       where:{ success: true},
//       orderBy: { id: 'desc' },
//       take: 1
//     }
//   }
// });

// const newPitch = await prisma.pitches.create({
//   data: {
//     slug : req.body.slug,
//     name : req.body.name,
//     city : req.body.city,
//     address : req.body.address,
//     tel : req.body.tel,
//     email : req.body.email,
//     site : req.body.site,
//     descr: req.body.descr,
//   }
// })

// const res =  await prisma.application.create({
//   data: { // Types of property 'name' are incompatible. Type 'string' is not assignable to type 'undefined'
//     name: "whatever",
//     applicant: {
//       create: {
//         email: "some@email.com",
//       },
//     },
//   },
// })

// const res = await prisma.application.upsert({
//   where: {
//     id: "eabd7580-cd4f-4cbc-a0b9-560dda87c6f0",
//   },
//   update: {
//     name:"sam"
//   },
//   create: {},
// });

// const convertBigIntToString = (obj) => {
//  return JSON.stringify(obj, (key, value) => {
//   if (typeof value === 'bigint') {
//       return value.toString() + 'n';
//   } 
//       return value;
// });
// }
 //console.log(convertBigIntToString({"amount": 12341234123412341234123412341234n }))

// const res = await prisma.order.create({
//   data: {
//     amount: 600.30,
//     tags: ['books','science','fiction']
//   }
// })

// const unsetTags = await prisma.order.update({
//   where: {
//     id: '64491a547658cb54c2b04e79'
//   },
//   data: {
//       tags: {
//         unset: true,
//       }
//     }
//   })
// const res = await prisma.user.create({
//   data: {
//     name: 'test user',
//     mobile: '+234111111111',
//     companies: {
//       create: [
//         { company: { create: { name: 'test company1' }, }, role: 'Manager' },
//         { company: { create: { name: 'test company2' } } ,  role: 'Senior Executive'},
//       ],
//     },
    
//   },
// })

// const res = await prisma.user.findMany({
//   include: { companies: { include: { company: true } } },
// })

// await prisma.user.delete({
//   where:{
//     id: 1
//   }
// })

// const roles = res.map(user => {
//   return user.companies.map(company => company.role);
// }).flat();
async function createTestData() {
  // Create a new user with questions and responses
  // const currency = await prisma.currency.create({
  //   data: {
  //     code:"USD",
  //     symbol:"$",
  //     Translation:{
  //       create:{
  //           displayName:"USD",
  //       }
         
        
  //     }
  //   }
  // })
  // const currency = await prisma.currency.findMany({
  //   include:{
  //     Translation: true
  //   }
  // })

  // const res = await prisma.summary.create({
  //   data:{
  //     date: new Date(),
  //     activityTime: 5,
  //     member: {
  //       create:{

  //       }
  //     }
  //   }
  // })

  // const res = await prisma.summary.findUnique({
  //   where:{
  //     date_memberToken:{
  //       date: "2023-04-30T00:00:00.000Z",
  //       memberToken: '3c4cb6df-98cb-407c-857b-ffa550a33d44'
  //     }
  //   }
  // })

  // const summary = await prisma.summary.findUnique({
  //   where: {
  //     date_memberToken: {
  //       date: "2023-05-30T00:00:00.000Z",
  //       memberToken: '3c4cb6df-98cb-407c-857b-ffa550a33d44',
  //     },
  //   },
  //   include:{
  //     member: true
  //   }
  // });
  // if (summary) {
  //   const res1 = await prisma.summary.update({
  //     where: {
  //       id: summary.id,
  //     },
  //     data: {
  //       activityTime: {
  //         increment: 1,
  //       },
  //     },
  //   });
  //   console.log('RES1', res1)
  // } else {
  //   const res2 = await prisma.summary.create({
  //     data: {
  //       date: new Date(),
  //       activityTime: 10,
  //       member: {
  //        connectOrCreate:{
  //         create:{
  //         },
  //         where:{
  //           token: '3c4cb6df-98cb-407c-857b-ffa550a33d44'
  //         }
  //        }
  //       },
  //     },
  //   });
  //   console.log('RES2', res2)
  // }

  // const res = await prisma.user.create({
  //   data:{
  //     name: "Joshua",
  //     followedBy: {
  //       create:{
  //         name: "Amos",
  //         followedBy: {
  //           connect: {
  //             id: 1
  //           }
  //         },
  //       }
  //     },
  //     following: {
  //       create:{
  //         name: "Alabi",
  //         following: {
  //           connect: {
  //             id: 1
  //           }
  //         }
  //       }
        
  //     }
  //   }
  // })
  // const res = await prisma.user.findMany({
  //   include:{
  //     followedBy: true,
  //     following: true
  //   }
  // })

  // const res = await prisma.collection.create({
  //   data:{
  //     floorPrices:{
  //       create:{
  //         description:"test desc"
  //       }
  //     }
  //   }
  // })

  // const res = await prisma.user.create({
  //   data: {
  //     name: "Sam Doe",
  //     email: "sam.doe@example.com",
  //     jobs: {
  //       create: {
  //         title: "Product manager",
  //         location: "California",
  //         start_date: new Date("2022-03-09"),
  //       },
  //     },
  //   },
  //   include: {
  //     jobs: true,
  //   },
  // });
  
  // const res = await prisma.user.findMany({
  //   where: {
  //     jobs: {
  //       some: {
  //         location: 'California'
  //       }
  //     }
  //   },
  // })

// const res = await prisma.user.create({
//   data:{
//     projects:{
//       create:{

//       }
//     },
//     createdProjects:{
//       create:{

//       }
//     }
//   }
// })

// const res = await prisma.tournaments.create({
//  data:{
//   token: 'test-token3',
//   wallet_address: 'test-wallet3',
//   name: 'test-name3',
//   twitter: 'test-twitter3',
//   address_limit: true,
//   participants: 3,
//   description: 'test-description3',
//   active: false,
//   startAt: new Date().toISOString()
//  }
// })

// const res = await prisma.user.create({
//   data:{
//     email: "test2@test.com",
//     password: 'test2-pass',
//     name: 'test2-name',
//     avatar: 'test2-avatar',
//     UserInfo:{
//       create:{
//         is_active: false
//       }
//     }
//   }
// })
const res = await prisma.user.findMany(
  {
    orderBy:[
      {
        UserInfo:{
          is_active: 'desc'
        },

      },
      {
        name: 'desc'
      }
    ]
  }
)

console.dir(res,  {depth:Infinity})
// console.log(Prisma.dmmf.datamodel.models)
 
}

// Call the function to create the test data
createTestData()
//console.dir(res,  {depth:Infinity})



// const convertJSONToBigInt = (j) => {
//   return JSON.parse(j, (key, value) => {
//     if (typeof value === 'string' && /^\d+n$/.test(value)) {
//       return BigInt(value.slice(0, -1));
//     }
//     return value;
//   });
// }

//console.dir(unsetTags, {depth:Infinity })

//console.log(convertJSONToBigInt(res.items))
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

 


