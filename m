Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 13A344875
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 30 Jan 2004 09:10:00 -0700 (MST)
Date: Fri, 30 Jan 2004 09:09:58 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] sti & b2k: doesn't work?
Message-ID: <20040130160958.GB12688@colo.lackof.org>
References: <400CB8A10000846A@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <400CB8A10000846A@ocpmta3.freegates.net>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Jan 30, 2004 at 03:01:12PM +0100, Joel Soete wrote:
> I plug a hp usb kdb (the one supplied with the workstation) in a usb port,
> then I reach to start palo in interactive mode to choose either a kernel
> 2.4 or 2.6. All start normaly untill I got a prompt for the login. But there,
> I can hit any key on this kbd, nothing happen even though the system is well
> running for the rest?? (same pb with latest cvs 2.4 and 2.6)

Are you building your own kernels?
You have USB keyboard/mouse built-in or loaded as a module?

grant
