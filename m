Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lxorguk.ukuu.org.uk (pc2-cwma1-4-cust86.swan.cable.ntl.com [213.105.254.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id EAAE7482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jul 2003 04:27:03 -0600 (MDT)
Received: from dhcp22.swansea.linux.org.uk (dhcp22.swansea.linux.org.uk [127.0.0.1])
	by lxorguk.ukuu.org.uk (8.12.8/8.12.5) with ESMTP id h6BAOTKd020475;
	Fri, 11 Jul 2003 11:24:29 +0100
Received: (from alan@localhost)
	by dhcp22.swansea.linux.org.uk (8.12.8/8.12.8/Submit) id h6BAORY6020473;
	Fri, 11 Jul 2003 11:24:27 +0100
Subject: Re: [parisc-linux] warning: minor abi change
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <3F0BEA830000084F@ocpmta1.freegates.net>
References: <3F0BEA830000084F@ocpmta1.freegates.net>
Content-Type: text/plain
Message-Id: <1057919066.8005.39.camel@dhcp22.swansea.linux.org.uk>
Mime-Version: 1.0
Date: 11 Jul 2003 11:24:27 +0100
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

On Gwe, 2003-07-11 at 09:26, Joel Soete wrote:
> PS2: Also for future 2.4.22, in binfmt_som.c '#error "Fix security hole before
> enabling me"' (line 216). Do you have any idea to fix it?

Look at the changes in binfmt_elf and copy them. Basically its about 
stopping someone doing

	clone with file sharing
	one thread		other thread
	exec			swap file handles around
	loads wrong binary suid
