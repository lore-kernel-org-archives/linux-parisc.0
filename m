From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] k-2.6.8-rc2-pa0 failled to boot in multi-user on
	N4k
Date: Mon, 26 Jul 2004 21:15:09 -0600
Message-ID: <20040727031509.GB22621@colo.lackof.org>
References: <40FB87C4000034E9@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: List Parisc <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40FB87C4000034E9@ocpmta3.freegates.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jul 26, 2004 at 06:42:45PM +0200, Joel Soete wrote:
> Umm i can try tommorrow.
> I just didn't do it till now because the only thing that is reproducible
> is the panic during the init 2, otc it doesn't seems to always hpmc a the
> same plae.

Well you can rule out any scripts that are started during "init 1".
Most likely, this is a bug related to networking.

> > > System Responder Address     = 0xfffffffffed25000
> > > System Requestor Address     = 0x000000fffed24000
> >
> > Requestor is likely a CPU. What is Responder? another CPU?
> > console output will tell us and sorry if you already sent it.
> >
> It possible that I forget it (sorry), here there is:

It is the second CPU.
So IPI is either not working or the second CPU is trying to start.
Can you try with ""maxcpus=1" and again with "nosmp"?
(see http://www.ibiblio.org/mdw/HOWTO/BootPrompt-HOWTO-3.html#ss3.4
for a description of those.)

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
