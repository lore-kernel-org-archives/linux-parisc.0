Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id E19AE4838
	for <parisc-linux@lists.parisc-linux.org>; Wed,  6 Mar 2002 11:51:25 -0700 (MST)
Received: from mastercard.com (unverified) by epirel991.europay.com
 (Content Technologies SMTPRS 4.1.5) with ESMTP id <Tac10592d59799add76@epirel991.europay.com> for <parisc-linux@lists.parisc-linux.org>;
 Wed, 6 Mar 2002 19:51:21 +0100
To: parisc-linux@lists.parisc-linux.org
Message-ID: <OF5C49A386.7B121133-ONC1256B74.00656CC0@com>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Wed, 6 Mar 2002 19:57:31 +0100
MIME-Version: 1.0
Content-type: multipart/mixed ; Boundary="0__=C1256B7400656CC08f9e8a93df938690918cC1256B7400656CC0"
Subject: [parisc-linux] evms-0.9.1 && hppa (follow ...)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--0__=C1256B7400656CC08f9e8a93df938690918cC1256B7400656CC0
Content-type: text/plain; charset=us-ascii

Hi all,

Awaiting the LKCD of Bruno, I try to figure out how to debug this bug
crashing the system without any other debuging then printk.

So with the help of a developper of evems (Kevin Corry) I put some printk
around ioctl code where crash occurs as follow:

...
int
evms_cs_allocate_memory(void **pp, int size)
{
        int rc = 0;

     printk(KERN_ERR "--evms: %s, %s call; size=%u.\n", __FILE__ ,
__FUNCTION__,  size );
     /* verify a valid size parameter was specified */
     if (size <= 0)
          /* return NULL on invalid size */
          *pp = NULL;
     else {
          *pp = kmalloc(size, GFP_KERNEL);
//        *pp = kmalloc(size, GFP_NOIO);
          if (*pp == NULL)
               rc = -ENOMEM;
          else {
               memset(*pp, 0, size);
               atomic_inc(&evms_allocs);
     printk(KERN_ERR "--evms: %s, %s call; size=%u, aft atomic_inc.\n",
__FILE__ , __FUNCTION__,  size );
          }
     }

        return(rc);
}
EXPORT_SYMBOL(evms_cs_allocate_memory);
...
#define MAX_IO_SIZE 128
static int
evms_ioctl_cmd_sector_io(void * arg)
{
        int rc;
     evms_sector_t io_size = MAX_IO_SIZE;
        evms_sector_io_t tmp, *user_parms;
        evms_logical_node_t *disk_node = NULL;
        evms_list_node_t *list_node;
        unsigned char *io_buffer;

     printk(KERN_ERR "--evms: %s, %s call.\n", __FILE__ , __FUNCTION__ );
     printk(KERN_ERR "io_buffer address: %u.\n", &io_buffer);
        rc = 0;
        list_node = NULL;
        io_buffer = NULL;

        user_parms = (evms_sector_io_t *)arg;
        /* copy user's parameters to kernel space */
        if (copy_from_user(&tmp, user_parms, sizeof(tmp)))
                rc = -EFAULT;

        /* check handle for validity */
        if (!rc) {
                rc = -EINVAL;
                disk_node = (evms_logical_node_t *)(tmp.disk_handle ^
EVMS_HANDLE_KEY);
                for (list_node = evms_global_device_list; list_node;
list_node = list_node->next)
                        if (list_node->item == disk_node) {
                                rc = 0;
                                break;
                        }
        }
        if (!rc) {
          /* allocate a io buffer upto 64Kbytes in size */
          if (tmp.sector_count < MAX_IO_SIZE)
               io_size = tmp.sector_count;

          /* allocate buffer large enough to hold a single sector */
                rc = evms_cs_allocate_memory(
               (void **)&io_buffer,
               io_size << EVMS_VSECTOR_SIZE_SHIFT);
     }
        /* perform io with specified disk */
        if (!rc) {
          evms_sector_t io_sector_offset, io_remaining;
          u_int64_t io_bytes;
          u_char *user_buffer_ptr;

          printk(KERN_ERR "--evms: %s, %s call, ckp6; rc=%i.\n", __FILE__ ,
__FUNCTION__, rc );
          io_remaining = tmp.sector_count;
          printk(KERN_ERR "--evms: %s, %s call, ckp7: io_remaining=%llu.
\n", __FILE__ , __FUNCTION__, io_remaining );
          io_sector_offset = 0;
          printk(KERN_ERR "--evms: %s, %s call, ckp7p: io_sector_offset
=%llu.\n", __FILE__ , __FUNCTION__, io_sector_offset );
          user_buffer_ptr = user_parms->buffer_address;
          printk(KERN_ERR "--evms: %s, %s call, ckp7pp.\n", __FILE__ ,
__FUNCTION__ );
          while(io_remaining) {
               /* compute the io_size for this pass */
               io_size = (io_remaining >= MAX_IO_SIZE) ?
                    MAX_IO_SIZE : io_remaining;

               io_bytes = io_size << EVMS_VSECTOR_SIZE_SHIFT;
                        /* for writes, copy a sector from user to kernel */
               printk(KERN_ERR "--evms: %s, %s call, ckp8; io_size=%i.\n",
__FILE__ , __FUNCTION__, io_size );
                        if (tmp.io_flag == 1) {
                                /* copy sector from user data buffer */
                                if (copy_from_user(io_buffer,
                                 user_buffer_ptr,
                                 io_bytes))
                                        rc = -EFAULT;
                        }
               printk(KERN_ERR "--evms: %s, %s call, ckp8; rc=%i.\n",
__FILE__ , __FUNCTION__, rc );
                        if (rc) break;

                        /* perform IO one sector at a time */
                        rc = INIT_IO(
                                disk_node,
                                tmp.io_flag,
                                io_sector_offset + tmp.starting_sector,
                                io_size,
                                io_buffer);
               printk(KERN_ERR "--evms: %s, %s call, ckp9; rc=%i.\n",
__FILE__ , __FUNCTION__, rc );

...

and here is what I obtain:
(capture with minicom on another system)

--ldev_mgr: scsi: Channel = 0, Id = 6, Lun = 0, Capacity = 17773524
--ldev_mgr: scsi: Channel = 0, Id = 3, Lun = 0, Capacity = 4194685
--evms: evms.c, evms_ioctl_cmd_sector_io call.
io_buffer address: 374884016.
--evms: evms.c, evms_cs_allocate_memory call; size=512.
--evms: evms.c, evms_cs_allocate_memory call; size=512, aft atomic_inc.
--evms: evms.c, evms_ioctl_cmd_sector_io call, ckp6; rc=0.
--evms: evms.c, evms_ioctl_cmd_sector_io call, ckp7: io_remaining=1.
--evms: evms.c, evms_ioctl_cmd_sector_io call, ckp7p: io_sector_offset=0.
WARNING! Stack pointer and cr31 do not correspond!
Dumping virtual address stack instead
...

(I also attache the full log if interest)

So it seems to failled on the assignement: "user_buffer_ptr =
user_parms->buffer_address;" . That is over my understanding without much
help. Any idea ?

Thanks in advance for attention and help,
     Joel

PS1: I cast (size_t) in the call to evms_cs_allocate_memory because I
suspect
first a BigEndian problem in the conversion between a unsigned long long
and
unsigned int . But it is not (another simple test prove it).

PS2: I also suspect a problem of optimisation with gcc-3 (known bug) and I
recompile all kernel and tools with option -O1 but no more success.

PS3: I use here the precompile tools of Debian pakage but as I presume it
does
not help. (I still have to post a major bug report about it for this panic)

PS4: This tools works perfectly on my i386 with a ext3 fs for the dir I
used the most: /usr/src until two weeks without any problems

(See attached file: K-2.4-Evms.doc.gz)

**********************************************************************
This e-mail and any attachments to it may contain confidential information which is strictly intended for the use of the authorised recipient.  If you have received this e-mail in error, please delete it and notify the sender by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************

--0__=C1256B7400656CC08f9e8a93df938690918cC1256B7400656CC0
Content-type: application/octet-stream;
	name="K-2.4-Evms.doc.gz"
Content-Disposition: attachment; filename="K-2.4-Evms.doc.gz"
Content-transfer-encoding: base64

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
iH3y+ijdM8zFpJxIYZiz92dN2nStp5ZpPFWGQQ+19wwzyDt96vWCYUptzddoe2wZDb2jX+2w5TIa
X2QZ+8UuAaS2TLqQ+i7pKh0fKws8OdOdjSYrD6ytVxsKzqPj5i+Osz45zivH6c/HmeW4vZBtft1p
/M8bR/7ajVEIP1K6lzNrY4UM49MWnho69DFKG6XJ9U49T1JFXsBJ4pp3u12zg3sKhnGT7ihg6T9i
oYm2jBMU0qMddnxa3/vZyqO84Cj5eHzT6c0AeXOFb234mv506M2ity692fDmcALWl5jA/DMmkHff
RPdR/BjtXb7n9+0HLisrb9oiZu5d9VP997iBUzY81MBzoK332pbdeUkBQ2/bpQLeywocekURe2mi
vegXWuUXCRWi2MVshqGXbzxUXra0J/D8VvIIT26LygIDv6Jj41a5rQqHAvTRboVHJSM/YF24SRhH
2+KeoOj4HndwPLotW4+yGEddZLWtHV4h5JsjnsOxTC4uM+Xxwimu1MtrMKrPUYtUCbH4Cf0Sggzp
DP2fbsdnt2fD99MTLJIbgF+mp7dUPWFDVw7qb7I43xrlWaqPO5qb4DxTVT528XGCxqKLNvpON51l
29n11VBVLt+Pq+pEXs7X9F5LM1p0r15XmvKq3gF6V72G/Hvrpbd4qIo9NxO3xX+h42HDP2ShdmKr
rxqFxc6CCtw4DDy0lfc6Kcxm9n8qe/h+PIUHeULYnYooqlWKWjoQwEo8iFWtW38V2sSQfvXAL2Iy
63V8i+lMZzrTmc50pjOd6UxnOtOZznSmM53pTGc605nOdKYznelMZzrTmc50pjOd6UxnOtOZznSm
M53pTGc605nOdKYznelMZzrTmc50pjOd6UxnOtOZznSmM53pTGc605nOdKYznelMZzrTmc50pjOd
6UxnOtOZznSmM53pTGc605nOdKYznelMZzrTmc50pjOd6UxnOtOZznSmM53pTGc605nOdKYznelM
ZzrT/9voum68dhzzmc985jOf+cxnPvOZz3zmM5/5zGc+85nPfOYzn/nMZz7zmc985jOf+cxnPvOZ
z3zmM5/5zGc+85nPfOYzn/nMZz7zmc985jOf+cxnPvOZz3zmM5/5zGc+85nPfOYzn/nMZz7zmc98
5jOf+cxnPvOZz3zmM5/5zGc+85nPfOYzn/nMZz7zmc985jOf+cxnPvOZz3zmM5/5zGc+85nPfOYz
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

--0__=C1256B7400656CC08f9e8a93df938690918cC1256B7400656CC0--
