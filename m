Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 125C74858
	for <parisc-linux@lists.parisc-linux.org>; Tue,  9 Jul 2002 16:12:41 -0600 (MDT)
Received: from npyu.esiee.fr (npyu.esiee.fr [147.215.7.13])
	by mail.esiee.fr (Postfix) with ESMTP id 2B72049C21
	for <parisc-linux@lists.parisc-linux.org>; Wed, 10 Jul 2002 00:12:40 +0200 (CEST)
Date: Wed, 10 Jul 2002 00:12:40 +0200
Mime-Version: 1.0 (Apple Message framework v482)
Content-Type: text/plain; charset=US-ASCII; format=flowed
From: Thibaut VARENE <varenet@esiee.fr>
To: PA/Linux <parisc-linux@lists.parisc-linux.org>
Message-Id: <FBA5EB89-9388-11D6-B21D-0030656F07A2@esiee.fr>
Subject: [parisc-linux] HWDB upgrade
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

Hi fellows,

This short mail to tell everyone that I have made some changes to the 
hwdb's code,
so that you can now register machines like rp7410 and others.

What's more, the redundancy check is now made on the "Model Output" 
field,
instead of the "Model" field, to avoid people making typos registering 
twice the same box.

HTH,


Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/
