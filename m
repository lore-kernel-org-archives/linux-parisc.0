Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 8 Apr 2003 09:35:02 -0600
To: bruno_vidal@hp.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] New dump driver patche.
Message-ID: <20030408153502.GE3547@dsl2.external.hp.com>
References: <03Apr8.130336cest.119063@ns.hiscom.nl> <3E92C42E.5B9BB871@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E92C42E.5B9BB871@hp.com>
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

On Tue, Apr 08, 2003 at 02:44:30PM +0200, bruno_vidal@hp.com wrote:
>     Hi
> Joel asked for something interresting, does someone know how I can retrieve
> an option passed to the kernel?

I think Randloph is right, MODULE_PARAM() should be sufficient.


But in case it's not, arch/parisc/kernel/setup.c:
	void __init start_parisc(unsigned arg0, unsigned arg1,

		arg1 is the command_line.

	void __init setup_arch(char **cmdline_p)

		cmdlinux_p is a pointer to "saved_command_line".
		a copy of the original.


An example is in kernel/printk.c:__setup("console=", console_setup);


hth,
grant
