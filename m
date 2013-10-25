From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Reproducible kernel panic using gcc
Date: Fri, 25 Oct 2013 10:16:13 +0200
Message-ID: <b6f8076c32d0859e4ddb328bb7aca076@tuxicoman.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_541aefaa37623873eb33251d646069ea"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--=_541aefaa37623873eb33251d646069ea
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8;
 format=flowed

Hi PA hackers,


Using a simple test program, I'm able to panic the kernel using gdb.

I've attached the test program. The output from the console is the 
following :

Bad Address (null pointer deref?): Code=6 regs=000000007e354370 
(Addr=0000000000000000)
CPU: 0 PID: 1605 Comm: gdb-crash Not tainted 3.10.6 #1
task: 000000007e354038 ti: 000000007e33c000 task.ti: 000000007e33c000

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111000001111 Not tainted
r00-03  000000ff0006fe0f 0000000000000000 0000000000000000 
00000000faf02300
r04-07  00000000406d3b30 0000000000000000 00000000000c8e98 
00000000000c7a80
r08-11  00000000000c8e70 00000000000c8e70 000000000000006c 
0000000000000061
r12-15  00000000000c3100 0000000000000000 00000000000bf100 
00000000000c0900
r16-19  0000000000000000 00000000000c0900 000000000009f000 
0000000000000000
r20-23  0000000000010638 0000000000000000 0000000000010638 
00000000406d11b8
r24-27  00000000faf02034 00000000faf0202c 0000000000000000 
00000000000110e4
r28-31  00000000faf0230c 0000000000000001 0000000000000000 
0000000040143327
sr00-03  0000000000334000 0000000000334000 0000000000000000 
0000000000334000
sr04-07  0000000000334000 0000000000334000 0000000000334000 
0000000000334000

IASQ: 0000000000334000 0000000000334000 IAOQ: 0000000000000000 
0000000000000004
  IIR: 43ffff80    ISR: 0000000010240000  IOR: 000000f400b02308
  CPU:        0   CR30: 000000007e33c000 CR31: fe1eec3fc1ecdbed
  ORIG_R28: 0000000000000000
  IAOQ[0]:           (null)
  IAOQ[1]: 0x4
  RP(r2):           (null)
Backtrace:


There is no info from PIM.


Thanks,
   Guy
--=_541aefaa37623873eb33251d646069ea
Content-Transfer-Encoding: base64
Content-Type: text/x-csrc;
 name=gdb-crash.c
Content-Disposition: attachment;
 filename=gdb-crash.c

LyoKVG8gcmVwcm9kdWNlIDoKIyBnY2MgLU8wIC1waXBlIC1nZ2RiMyBnZGItY3Jhc2guYyAtbyBn
ZGItY3Jhc2gKIyBnZGIgZ2RiLWNyYXNoCihnZGIpIGJyZWFrIGdkYi1jcmFzaC5jOjI0CihnZGIp
IHJ1bgooZ2RiKSBzZXQgdHAgPSB7MCwwfQoqY3Jhc2gqCiovCgojaW5jbHVkZSA8c3RkaW8uaD4K
CnN0cnVjdCB0ZXN0IHsKCWludCBhOwoJaW50IGI7Cn07CgppbnQgbWFpbigpIHsKCglzdHJ1Y3Qg
dGVzdCB0diA9IHsgMSwgMSB9OwoKCXN0cnVjdCB0ZXN0ICp0cCA9ICZ0djsKCglwcmludGYoIlRl
c3QgaXMgJXUsICV1XG4iLCB0di5hLCB0di5iKTsKCglyZXR1cm4gMDsKfQo=
--=_541aefaa37623873eb33251d646069ea--


