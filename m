Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 11 Jan 2003 20:02:10 -0700
To: Thibaut VARENE <varenet@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.5.56-pa0 64bit successful boot
Message-ID: <20030112030210.GA28585@dsl2.external.hp.com>
References: <20030112021041.32cfbb84.varenet@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030112021041.32cfbb84.varenet@esiee.fr>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Sun, Jan 12, 2003 at 02:10:41AM +0100, Thibaut VARENE wrote:
> Hi pa-ckers!
> 
> I just tested fresh 2.5.56 and successfully booted 64bit UP kernel.
> Linux mkhppa3 2.5.56-pa0 #2 Sun Jan 12 01:34:36 CET 2003 parisc64 unknown unknown GNU/Linux

cool!

> I had some errors with SCSI and SERIAL (see the attached dmesg and .config).
> I'll have a look at them ASAP.

you can also post them here...I'll be able to look at them tomorrow.

> FWIW, SMP kernel with the exact same configuration died just at:
> POSIX conformance testing by UNIFIX

What's the UP kernel say after that when it boots?

thanks,
grant
