Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id CCC3A482C
	for <parisc-linux@parisc-linux.org>; Mon, 25 Mar 2002 08:50:58 -0700 (MST)
Received: from mailhub.rose.hp.com (mailhub.rose.hp.com [15.96.64.24])
	by atlrel8.hp.com (Postfix) with ESMTP id 1A930A00807
	for <parisc-linux@parisc-linux.org>; Mon, 25 Mar 2002 10:50:57 -0500 (EST)
Received: from ros-saab (ros-saab.rose.hp.com [15.43.213.64]) by mailhub.rose.hp.com with ESMTP (8.7.1/8.7.3 SMKit7.02) id HAA25606 for <parisc-linux@parisc-linux.org>; Mon, 25 Mar 2002 07:50:54 -0800 (PST)
Received: from ros-saab
	([127.0.0.1] helo=there ident=ptelford)
	by ros-saab with smtp (Exim 3.34 #1 (Debian))
	id 16pWj2-00029c-00
	for <parisc-linux@parisc-linux.org>; Mon, 25 Mar 2002 07:49:36 -0800
Content-Type: text/plain;
  charset="iso-8859-1"
From: Paul Telford <paul_telford@hp.com>
To: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Date: Mon, 25 Mar 2002 07:49:36 -0800
References: <Pine.LNX.4.33.0203232012090.18420-100000@goliath.alaskatech.org> <20020324082040.183814844@dsl2.external.hp.com>
In-Reply-To: <20020324082040.183814844@dsl2.external.hp.com>
MIME-Version: 1.0
Message-Id: <E16pWj2-00029c-00@ros-saab>
Subject: [parisc-linux] latest lvm10 package broken?
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

I recently started getting frequent (several times a day) crashes on my A180. 
Investigating the problem, I found that it started after I had upgraded the 
lvm10 package to the latest version (1.1rc1-1).  Downgrading back to 
1.0.1release-1 seems to have solved the problem.  Based on the crash output, 
IAOQ seems to point to find_inode, which looks consistent with an lvm 
problem.  Just wanted to give a heads-up in case anyone else is running lvm 
and is experiencing problems...




 Paul.
