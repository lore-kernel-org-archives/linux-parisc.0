Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id XAA10670
	for <hppa-linux@sod.res.cmu.edu>; Wed, 24 Mar 1999 23:36:36 -0500
Received: from tintin.mcom.com (tintin.mcom.com [205.217.233.42])
	by netscape.com (8.8.5/8.8.5) with ESMTP id UAA09183
	for <hppa-linux@thepuffingroup.com>; Wed, 24 Mar 1999 20:35:57 -0800 (PST)
Received: from netscape.com ([205.217.243.139]) by
          tintin.mcom.com (Netscape Messaging Server 4.03) with ESMTP id
          F94VG400.F9Q for <hppa-linux@thepuffingroup.com>; Wed, 24 Mar
          1999 20:36:04 -0800
Sender: shaver@netscape.com (Mike Shaver)
Message-ID: <36FA735B.A36FDB6D@netscape.com>
Date: Thu, 25 Mar 1999 12:33:15 -0500
From: Mike Shaver <shaver@netscape.com>
MIME-Version: 1.0
To: hppa-linux@thepuffingroup.com
Content-Type: multipart/mixed;
 boundary="------------730027CB6170D7FBD3ED2024"
Subject: [hppa-linux] syscall work
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------730027CB6170D7FBD3ED2024
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

I've committed a mildly updated version of unistd.h, which contains the
magic _syscall<n> macros.  I'm sure I'm doing silly things, so you
should all point and laugh as approriate.

I've attached the relevant chunks for your easy mocking.

Mike

-- 
22863.99 20474.77
--------------730027CB6170D7FBD3ED2024
Content-Type: text/plain; charset=us-ascii;
 name="syscall.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="syscall.c"


#define syscall_prolog                                                        \
    register long __res __asm__("%r22");                                      \
    register long __err __asm__("%r28");

#define syscall_epilog(type)                                                  \
if (__err == 0)                                                               \
        return (type) __res;                                                  \
errno = __res;                                                                \
return -1;

#define _syscall0(type,name)                                                  \
type name(void)                                                               \
{                                                                             \
    syscall_prolog;                                                           \
    __asm__ volatile ("ldil L%%0xC0000004,%%r1\n\t"                           \
                      "ble  R%%0xC0000004(%%sr7,%%r1)\n\t"                    \
                      "ldo  %2,%%r22"                                         \
                      : "=r" (__res), "=r" (__err)                            \
                      : "i" (__NR_##name));                                   \
    syscall_epilog(type);                                                     \
}

#define _syscall1(type,name,atype,a)                                          \
type name(atype a)                                                            \
{                                                                             \
    syscall_prolog;                                                           \
    __asm__ volatile ("ldo  %2,%%arg0\n\t"                                    \
                      "ldil L%%0xC0000004,%%r1\n\t"                           \
                      "ble  R%%0xC0000004(%%sr7,%%r1)\n\t"                    \
                      "ldo  %3,%%r22"                                         \
                      : "=r" (__res), "=r" (__err)                            \
                      : "i" (__NR_##name), "r" ((long)a));                    \
    syscall_epilog(type);                                                     \
}

--------------730027CB6170D7FBD3ED2024--
