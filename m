Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8AAEF484E
	for <parisc-linux@lists.parisc-linux.org>; Sat, 26 Oct 2002 16:34:43 -0600 (MDT)
Message-ID: <3DBB27FD.1000704@freebel.net>
Date: Sat, 26 Oct 2002 23:40:45 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: Joel Soete <joel.soete@freebel.net>
Cc: jsoe0708@tiscali.be, Randolph Chung <randolph@tausq.org>,
	Stefan Pfetzing <dreamind@dreamind.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: mkfs.xfs (xfsprogs-2.3.5) failled
References: <3DB5776100000C32@ocpmta8.be.tiscali.com> <3DBAD364.9060301@freebel.net>
Content-Type: text/plain; charset=us-ascii; format=flowed
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


Joel Soete wrote:
> Hmm question about "default:" uaccess.h implementation on different 
> platform:
> 
> i386 declare: "extern void __get_user_bad(void);"
> 
> ia64: "extern void __get_user_unknown (void);"
> 
> mips: "extern void __get_user_unknown(void);"
> ...
> but not define elsewhere? (is it there so that the build of the kernel 
> failed if that case was requested to run properly?)

In the mean time I verify this hypothesis. So may I suggest a patch in 
this direction?

[Better would be to add _also_ support as in the patch I suggest in 
<http://lists.parisc-linux.org/pipermail/parisc-linux/2002-October/017887.html>
this was tested for __put_user_asm_64 && __put_kernel_asm_64 (not the 
corresponding __get_ :( I don't know yet if I can use a .fixup section ?)

May be some other could test and verify closer this part ?

Joel

> 
> Thanks in advance for attention,
>     Joel
> 
> PS: afaik on i386 only put_user_u64 is define why not pending get_user?
> 
> 
> jsoe0708@tiscali.be wrote:
> 
>> too bad:
>>
>>  man ioctl advise that it would return -1 (not ENOTSUP which would be 
>> assign
>> to errno) I will try to see how?
>>
>> Sorry to annoy,
>>     Joel
>>
>>
>>> -- Original Message --
>>> From: jsoe0708@tiscali.be
>>> Subject: Re: [parisc-linux] Re: mkfs.xfs (xfsprogs-2.3.5) failled
>>> To: "Randolph Chung" <randolph@tausq.org>,
>>>     "Stefan Pfetzing" <dreamind@dreamind.de>
>>> Cc: parisc-linux@lists.parisc-linux.org
>>> Date: Fri, 25 Oct 2002 14:58:42 +0200
>>>
>>>
>>> Hi Randolph,
>>>
>>> It sure I found a bug in the two parts kernel and xfs.
>>>
>>> A. The kernel hppa: put_user and get_user does just a printk for BUG 
>>> messages
>>> but don't return error code as ENOTSUP (or what else) (what I assume the
>>> other platforms does when they do not yet support BLKGETSIZE64?)
>>>
>>> Here is a small patch I suggest:
>>> (I do not reach to implement an operational support of BLKGETSIZE64 [for
>>> 32bits kernel]; I do not find a easy way to manage code failure :-( )
>>>
>>> --- uaccess.h.orig    2002-10-22 15:14:54.000000000 +0200
>>> +++ uaccess.h    2002-10-23 13:46:48.000000000 +0200
>>> @@ -35,10 +35,10 @@
>>> #define get_user __get_user
>>>
>>> #if BITS_PER_LONG == 32
>>> -#define LDD_KERNEL(ptr)        BUG()
>>> -#define LDD_USER(ptr)        BUG()
>>> -#define STD_KERNEL(x, ptr)    BUG()
>>> -#define STD_USER(x, ptr)    BUG()
>>> +#define LDD_KERNEL(ptr)        BUG(); __gu_err=ENOTSUP;
>>> +#define LDD_USER(ptr)        BUG(); __gu_err=ENOTSUP;
>>> +#define STD_KERNEL(x, ptr)    BUG(); __pu_err=ENOTSUP;
>>> +#define STD_USER(x, ptr)    BUG(); __pu_err=ENOTSUP;
>>> #else
>>> #define LDD_KERNEL(ptr) __get_kernel_asm("ldd",ptr)
>>> #define LDD_USER(ptr) __get_user_asm("ldd",ptr)
>>> @@ -75,7 +75,7 @@
>>>         case 2: __get_kernel_asm("ldh",ptr); break; \
>>>         case 4: __get_kernel_asm("ldw",ptr); break; \
>>>         case 8: LDD_KERNEL(ptr); break;        \
>>> -        default: BUG(); break;                      \
>>> +        default: BUG(); __gu_err=ENOTSUP; break;    \
>>>         }                                           \
>>>     }                                               \
>>>     else {                                          \
>>> @@ -84,7 +84,7 @@
>>>         case 2: __get_user_asm("ldh",ptr); break;   \
>>>         case 4: __get_user_asm("ldw",ptr); break;   \
>>>         case 8: LDD_USER(ptr);  break;        \
>>> -        default: BUG(); break;                      \
>>> +        default: BUG(); __gu_err=ENOTSUP; break;    \
>>>         }                                           \
>>>     }                                               \
>>>                             \
>>> @@ -144,7 +144,7 @@
>>>         case 2: __put_kernel_asm("sth",x,ptr); break;       \
>>>         case 4: __put_kernel_asm("stw",x,ptr); break;       \
>>>         case 8: STD_KERNEL(x,ptr); break;            \
>>> -        default: BUG(); break;                              \
>>> +        default: BUG(); __pu_err=ENOTSUP; break;        \
>>>         }                                                   \
>>>     }                                                       \
>>>     else {                                                  \
>>> @@ -153,7 +153,7 @@
>>>         case 2: __put_user_asm("sth",x,ptr); break;         \
>>>         case 4: __put_user_asm("stw",x,ptr); break;         \
>>>         case 8: STD_USER(x,ptr); break;            \
>>> -        default: BUG(); break;                              \
>>> +        default: BUG(); __pu_err=ENOTSUP; break;        \
>>>         }                                                   \
>>>     }                                                       \
>>>                                 \
>>>
>>> If all agreed, (awaiting better :?) can somebody ci it?
>>>
>>>
>>> Thanks in advance for attention,
>>>   Joel
>>>
>>> PS: B. in xfs:
>>>
>>>     error = ioctl(fd, BLKGETSIZE64, &size);
>>> -    if (error >= 0) {
>>> +    if (!error) {
>>>         /* BLKGETSIZE64 returns size in bytes not 512-byte blocks */
>>>
>>> AFAIK ioctl should return error=0 if success and error <>0 (>0?)
>>> here is the full patch I will suggest:
>>>
>>> --- cmd/xfsprogs/libxfs/init.c.orig    2002-10-25 12:12:29.000000000 
>>> +0200
>>> +++ cmd/xfsprogs/libxfs/init.c    2002-10-25 14:22:34.000000000 +0200
>>> @@ -155,11 +155,14 @@
>>>             progname, path, strerror(errno));
>>>         exit(1);
>>>     }
>>> +#if !defined(__hppa__) || defined(__LP64__)
>>>     error = ioctl(fd, BLKGETSIZE64, &size);
>>> -    if (error >= 0) {
>>> +    if (!error) {
>>>         /* BLKGETSIZE64 returns size in bytes not 512-byte blocks */
>>>         size = size >> 9;
>>> -    } else {
>>> +    } else
>>> +#endif
>>> +        {
>>>         /* If BLKGETSIZE64 fails, try BLKGETSIZE */
>>>         unsigned long tmpsize;
>>>         error = ioctl(fd, BLKGETSIZE, &tmpsize);
>>>
>>> _______________________________________________
>>> parisc-linux mailing list
>>> parisc-linux@lists.parisc-linux.org
>>> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>>
>>
>>
>> _______________________________________________
>> parisc-linux mailing list
>> parisc-linux@lists.parisc-linux.org
>> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>>
> 
> 
