From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: 2.6.31-rc1: parisc: multiple PCI BAR collisions
Date: Fri, 26 Jun 2009 12:58:22 +0400
Message-ID: <a4423d670906260158q15080049ue516c3d454f4afbf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: linux-parisc@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi

Hardware is HP j6000.
It cannot initialize many PCI devices (sym53c8xx, tulip, STI,
usb(onci)) and cannot boot (no root device).
Messages like this:
sym53c8xx 0:0:0f.0: device not available because of BAR 1 [0xf4005000
- 0xf40053ff] collisions.
