From: CrazyCat <crazycat@c-p-f.org>
Subject: [parisc-linux] Booting 712/80 without keyboard
Date: Wed, 07 Jul 2004 15:05:58 +0200
Message-ID: <40EBF536.8030207@c-p-f.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi there,

I've found a way to simulate a keyboard on my 712/80, but not tested yet...
This is a dongle for PS/2:

1o [] o6
2o    o5
3o    o4
Connect 1 - 5 with wire link
Connect 4 - 6 with wire link
Connect 2 - 5 with 220R resistor and LED (cathode to 5)

Does anyone already make something like this? I don't want to crash my
engine...

And don't you know if this kind of dongle are selled somewhere (I prefer
when it's manufacturer than myself) ?

Thanks a lot
-- 
Tout sur les eggdrops
http://www.c-p-f.org
ML @ eggdrop_fr@yahoogroupes.fr


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
