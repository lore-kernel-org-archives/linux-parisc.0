Return-Path: <Ivar.Olav.Harstad.Orskaug@idi.ntnu.no>
Received: from ray.idi.ntnu.no (ray.idi.ntnu.no [129.241.107.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id BF8754854
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 13 Jan 2004 07:37:23 -0700 (MST)
Received: from db-gr1.idi.ntnu.no (db-gr1.idi.ntnu.no [129.241.111.242])
	by ray.idi.ntnu.no (8.12.10/8.12.10) with ESMTP id i0DEbLDx014980
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 13 Jan 2004 15:37:21 +0100 (MET)
Date: Tue, 13 Jan 2004 15:37:21 +0100 (CET)
From: Ivar Orskaug <Ivar.Olav.Harstad.Orskaug@idi.ntnu.no>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.BSF.4.58.0401131521300.24660@db-gr1.idi.ntnu.no>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] kernel compilation time
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi,
just installed a fresh Debian on a C3000/8500. I did a kernel
recompile and after 15 minutes binutils terminated compilation,
complaining about too long arguments.  However, is this normal compilation
time? I know this is not an acurate metric, but gives an idea. I
just did an make oldconfig and then rebuilt the kernel. What is the normal
kernel compilation time on these machines?
The running kernel was 2.4.21.

	/Ivar
