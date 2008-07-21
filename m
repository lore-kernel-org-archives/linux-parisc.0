From: Joel Soete <soete.joel@scarlet.be>
Subject: ccio_mark_invalid(): would it have to clear a bit or byte?
Date: Mon, 21 Jul 2008 14:51:08 +0000
Message-ID: <4884A25C.7000902@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello all,

given this comment:
  * Given a virtual address (vba, arg2) and space id, (sid, arg1),
  * load the I/O PDIR entry pointed to by pdir_ptr (arg0). Each IO Pdir
  * entry consists of 8 bytes as shown below (MSB == bit 0):
  *
  *
  * WORD 0:
  * +------+----------------+-----------------------------------------------+
  * | Phys | Virtual Index  |               Phys                            |
  * | 0:3  |     0:11       |               4:19                            |
  * |4 bits|   12 bits      |              16 bits                          |
  * +------+----------------+-----------------------------------------------+
  * WORD 1:
  * +-----------------------+-----------------------------------------------+
  * |      Phys    |  Rsvd  | Prefetch |Update |Rsvd  |Lock  |Safe  |Valid  |
  * |     20:39    |        | Enable   |Enable |      |Enable|DMA   |       |
  * |    20 bits   | 5 bits | 1 bit    |1 bit  |2 bits|1 bit |1 bit |1 bit  |
  * +-----------------------+-----------------------------------------------+
  *

and also this:
         while (byte_cnt > 0) {
                 /* clear I/O Pdir entry "valid" bit first */
                 ((unsigned char *) pdir_ptr)[7] = 0;

So if I well understand 'Valid' field of a pdir entry is well of 1 bit but the code cleanup a all byte?

Is coding something like:
#define PTE_VALID_BIT_MASK      0xfffffffffffffffeULL	

		*pdir_ptr &= PTE_VALID_BIT_MASK;

wouldn't do better what comment says it does?

Well a short test seems to help but doesn't fix all issue:

patst007 login: end_request: I/O error, dev sdl, sector 6659574
__ratelimit: 32 messages suppressed 

Buffer I/O error on device sdl9, logical block 193374 

lost page write due to I/O error on sdl9 

Buffer I/O error on device sdl9, logical block 193375 

lost page write due to I/O error on sdl9 

Buffer I/O error on device sdl9, logical block 193376 

lost page write due to I/O error on sdl9 

Buffer I/O error on device sdl9, logical block 193377 

lost page write due to I/O error on sdl9 

Buffer I/O error on device sdl9, logical block 193378 

lost page write due to I/O error on sdl9 

Buffer I/O error on device sdl9, logical block 193379 

lost page write due to I/O error on sdl9 

Buffer I/O error on device sdl9, logical block 193380 

lost page write due to I/O error on sdl9
Buffer I/O error on device sdl9, logical block 193381
lost page write due to I/O error on sdl9
Buffer I/O error on device sdl9, logical block 193382
lost page write due to I/O error on sdl9
Buffer I/O error on device sdl9, logical block 193383

Tia for all advise,
	J.
