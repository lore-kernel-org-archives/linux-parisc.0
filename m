Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.cvee.org (primare.xs4all.nl [213.84.188.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2A537482A
	for <parisc-linux@parisc-linux.org>; Sun, 31 Mar 2002 05:48:50 -0700 (MST)
Received: from mail.cvee.org (localhost [127.0.0.1])
	by mail.cvee.org (8.12.2/8.12.2/Debian -5) with ESMTP id g2VCmmNi000303
	for <parisc-linux@parisc-linux.org>; Sun, 31 Mar 2002 14:48:48 +0200
Received: (from djmuggs@localhost)
	by mail.cvee.org (8.12.2/8.12.2/Debian -5) id g2VCmmrv000302
	for parisc-linux@parisc-linux.org; Sun, 31 Mar 2002 14:48:48 +0200
From: DJ Tha Muggs <djmuggs@mail.cvee.org>
Date: Sun, 31 Mar 2002 14:48:48 +0200
To: parisc-linux@parisc-linux.org
Message-ID: <20020331124848.GA291@cvee.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] IDE Harddisks in a C3K
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

Anyone experienced with using IDE hdd's in a C3K?

Because i got some issue's with this, i'm just trying to see if it works, but it
crashes the complete system when using IDE hhd's.
Mounting the disk is no problem, but copying and moving stuff around causes
the system to crash, a stack dump.
After booting the system and then trying to mount i get warning that
partitions are not clean and should be fsck'd.
When doing this it can go good or bad, bad means again a stack dump.
A Portion of the stack dump you can find below, this one was caused while
copying data.

What i noticed when FSCKing, Copying or Moving stuff all the free memory
will be used up at the end, when endig the process i get the memory back.
Mainly i think there is problem with the VM, because a lot of dumps show VM
errors.

I have not connected the IDE cd-rom now, but when i was using this i never
noticed the problems above.

Are IDE badly supported or no one realy tried it yet?

<stack dump>
WARNING! Stack pointer and cr30 do not correspond!
Dumping virtual address stack instead

Dumping Stack from 0x2a858000 to 0x2a8586c0:
8000 8d363d03 5de563a5 aef06f1a 6839cb5c 48cf9be9 04eb4f29 4ff570f8 57aa980f
8020 c1869084 9d23356d 738650a1 0375b1b9 995cc486 3c36d9d4 8c6925d2 6dc55d09
8040 60ca8ad2 7237b043 8ceb2e0d 966356b6 621e72de f753458d 34da7885 82518273
8060 809c0e0d 29ec537f b1dfffff ffffffff ffeaf927 51913498 052b3bdc 4dfface0
8080 c7d818e1 6a23dfdc da144af5 71705417 f6f6d374 f21f12ae 87ac9c34 1200cf16
80a0 1276b824 c3bd449a 4f1f824c 6f1dc731 a0ac3155 468aa2b1 8f9672ea 8a788c88
80c0 d8a36274 a454d9c1 5511b214 0dc2d7d6 a3e59b4a ddd77fd2 bfe6bafb f7c56247
80e0 0fa0e099 eb31ea2a c275094f 155356c5 219882dc a76edb72 d38d2b1f 5970a4f0
8100 181b609e 72aa5bfa 4581fbea a14f50f4 384e8df5 4be34cf9 20e65aaa 23290e49
8120 92474664 73b0b353 a84b9214 74296654 b8d98d5b 019174ed c1912dbb d1f4d0bc
8140 3c45d408 76be6db8 b34fadd7 d2df77f1 6a504c98 c40b9ff7 dfffffff ffffffff
8160 ffa86213 d1e4997d 54058add 6e4f0c89 9dc00dca 958572ce 2b05409d 3456cee3
8180 e5476481 3c2f2501 cece9727 26fffba0 04c98003 c5305603 2f7a6074 670ae061
81a0 ef5c0f58 e1580cbd eb81f11d eb4197bd 703d83d8 e301dc5a 0be93d09 a56a895e
81c0 84378651 b741cc29 2896b431 813eaf8a 88428e82 773ae673 e5ca1c06 fc3e55bc
81e0 2e4c70bb e83a7d1f bba376dd c3dea2bd f1fcff74 ff50e0ea af717f59 f4d79573
8200 7a6a1c2c ee686ba2 ee274b39 dc2a410c b9f2b8aa 9b2ee7fa d214ae6f 683a154b
8220 a518b21a 4ac3bcff 42d72822 db052065 89993655 b9a18c6d 012a3a45 84e9434b
8240 b96f7ce6 7a9e2aa4 bb1ab8e7 4ea410dc 32c66541 297adb09 ce959585 7e24b7df
8260 810615eb 023c7a47 c7bd6def 8dc7d52d 68162611 1006d4b6 a47c5af8 49dd7f50
8280 51bc8185 53214d56 85793b93 01b4e606 e2cb6433 39654b56 5d4eb1e3 f2e66b17
82a0 8db76a0b 96dbbb91 44ad43c5 5b4cb1a5 269aab48 1bf5f83c 8eb5c16f 99568845
82c0 87b20c63 1784a9b4 9b4250e5 5284b651 957d70a5 38d81918 94383728 fecfa90e
82e0 d6859648 4d986187 a8b1b75c ef38ae35 278d1e4d 5ed6d66d 2a14dbd0 ba4bde6b
8300 ce23402a 3a22b599 35696baf 38f44062 43276050 668a5aa7 588bf17d 42859ac7
8320 e3239ab0 fa807405 d8e62fb3 27c57c8b 4e9baf46 046360e3 8c911ca6 e30a458d
8340 91c1171e d0d3d159 61a754cc 2d87131d f08e4ebe 78d94708 b7cda90e b7d5696c
8360 d64dd339 95c05001 81184416 7b1c97d5 bdd7d040 58240ac2 22497664 2f2bfeca
8380 e2f216b0 ad438e88 8e0f2f1e 158bc974 45120462 14a12fff fba204ca 8003e837
83a0 d5832f7a e07e476a d06b0f5c 0eb4cd56 0cbdeb81 dc9d6b81 a7bd70c9 94bad2b5
83c0 4a1d0618 d834e22f 97b3ac93 81a2883b 0c66c186 6613956a 6134668e 7913c75a
83e0 5cbe2edb 93b590bb aa92b0b0 d6c4cb22 86489363 4ff52dae e2e19899 96d9bff9
8400 cfd6afac 5f35bee0 e35a8d85 6a8d1535 1b174581 60263ab3 5be9c92c 38b8626e
8420 98d52a57 387b891e 2f59735e 5ca75e16 d6091207 d92f460e 916c2fc1 6813d208
8440 09a274da 691bcae4 b0bd25c8 2ba90962 75a54286 c53359d8 1b4e8573 12975a5d
8460 cca06bc4 78cf95ec 559a47d7 8d0b70a7 b4d3448b 5d6e4d14 98061a32 851572c5
8480 7fffffff ffffffff fff5c930 12e56e00 875d2244 bf5962d1 13a5db61 4bbd55b3
84a0 cb787b8e 509f8649 a2869714 72ed143d 28b36e09 500811d0 02c0f000 d4b694e1
84c0 cccec03b 990d2596 e6c4ca54 62b2a7cb 0ab0b8a7 0b198a87 2e8fa8cb 105747cb
84e0 921284b6 4551c060 b45a6fbd edd4cd7c b36336ad 73f36c63 3a8d9cef 568f1828
8500 d44ed215 ce19dc14 50381a96 282404d7 a2152ad3 2a7270b7 2790ec2b 9fb351c5
8520 a8739faa c5c0f684 e2600e05 02ed540b 22910b4d 1ea441c6 0d14d13b 3c0f131c
8540 e53a03f9 8c639c48 c44b2a22 89e552a6 29db5533 6a75f4f0 fb0ac2b1 9b4fef3e
8560 9be359f5 37bd45b6 20d299cc 7d02a100 d1f34173 2d7a0a9d 31fa8961 18016106
8580 8bec9a89 e0b6a9a9 207869ac 2928f520 a245478a 7a30a7d3 aa350ad3 4a14870d
85a0 e710fffb a004ca00 03e23255 836f7ae0 78a71ad0 65ef5c0e eccb540d 3deb81eb
85c0 1c2b01a7 bd71522c a187d126 0c60981d e6f09a8b 4a254e58 0b79332b 4988cd21
85e0 40ca0cf2 0cab2fca 55f88e24 85ac96c6 54c14537 abce95c3 f9535562 59382683
8600 7b561673 aaee6ff7 79ad57b3 db7feeb8 f6b41ba5 585a9aeb 1b149416 b179d763
8620 d10eda9e 90dc8551 b59cc774 d5730c96 2259144d e12185a3 b507b4cc 0d682553
8640 107cc00f 81343793 962c310c c18345c7 c6c2a1b1 58987ea1 5b828269 dc7f53c1
8660 cc96a8b0 5c8a385e 73ed17c4 7f463aaf e6b97c69 d8dd7e66 f7bc0e31 7e04267c
8680 553729b7 9397bbd3 fc67033c 51235225 ad3c0e15 59a749d2 54f5b518 9cb3377b
86a0 afb410d0 61c698c4 2e3debc7 b0e47980 4ba1c537 82543054 6ced94a0 bae5634e

Kernel Fault: Code=26 regs=1a8586c0 (Addr=00000007)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001111 Not tainted
r00-03  00000000 1031f810 1012ddc8 ffffffff
r04-07  00000001 263ff120 ffffffff 00000001
r08-11  00000000 2ff00110 263ff080 faf01250
r12-15  00001000 00000000 fffffff4 263ff120
r16-19  1a8585cc 2e47f140 00000000 0001ffff                                   
r20-23  0000009f 00000044 00000131 2ff00000
r24-27  ffffffff 00000001 263ff120 10304010
r28-31  ffffffea 0000000e 1a8586c0 10139fe4
sr0-3   00000000 00000478 00000000 00000478
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1012ae24 1012ae28
 IIR: 0c701093    ISR: 00000000  IOR: 00000007
 CPU:        0   CR30: 1a858000 CR31: 103b8000
 ORIG_R28: 6f707172
</stack dump>
