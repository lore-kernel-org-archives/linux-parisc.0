Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maximilian.max.uni-duisburg.de (schem4145.uni-duisburg.de [134.91.69.2])
	by dsl2.external.hp.com (Postfix) with SMTP id 129C8482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Jan 2002 11:33:42 -0700 (MST)
Received: from phil by nepomuk.max.uni-duisburg.de with local (Exim 3.12 #1 (Debian))
	id 16S0JD-0000EV-00
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Jan 2002 19:33:43 +0100
Date: Sat, 19 Jan 2002 19:33:43 +0100
From: Philipp Schulte <pschulte@uni-duisburg.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020119193343.A876@nepomuk.max.uni-duisburg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Boot console problems
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

Hello,
I am trying to install parisc-linux on a HP 735. The problem is that I
can not specify the boot device. I hit ESC during the boot-process and
I get the menu where I can choose between:

---
a) Boot from specified device
s) Search fpr bootable devices
a) Enter boot administration mpde
x) Exit and continue boot sequence
?) Help

Select from menu:
---

But then nothing happens no matter what key I press. The cursor just
jumps to the "S" of "Select". Even "? <RETURN>" gives no output at
all.
I thought that it might have something to do with my serial console
but I tried using another PC with minicom and got the same result.
If I just let the machine boot to HP-UX then everything works fine, I
can execute commands and stuff.
Does someone know whats going on here or how to avoid this problem?
Regards,
Phil
