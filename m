From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] remove hil_kbd.c?
Date: Tue, 15 Mar 2005 21:55:41 -0700
Message-ID: <20050316045541.GA10031@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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

Helge, et al,
I was wondering why we have two hil keyboard files:
	drivers/input/keyboard/hil_kbd.c
	drivers/input/keyboard/hilkbd.c

The header comments suggest Helge is maintaining hilkbd.c
and we should delete the other:
==> hil_kbd.c <==
/*
 * Generic linux-input device driver for keyboard devices
 *
 * Copyright (c) 2001 Brian S. Julin
 * All rights reserved.
...

Is that correct?

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
