From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] c3000 boot problem
Date: Fri, 16 Jul 2004 16:06:27 -0600
Message-ID: <20040716220627.GA14404@colo.lackof.org>
References: <20040716201438.7022ce8f.arnau.bria@analisisysimulacion.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Arnau Bria Ramirez <arnau.bria@analisisysimulacion.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040716201438.7022ce8f.arnau.bria@analisisysimulacion.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jul 16, 2004 at 08:14:38PM +0200, Arnau Bria Ramirez wrote:
> >Normally yes. See "Bug Reporting" link off of www.parisc-linux.org:
> >	http://www.parisc-linux.org/faq/kernelbug-howto.html
> 
> Ok, but as I have to copy it by hand I ask before ....

ah...you might try with serial console.
It avoids many of the problems we've had with the IO subsystem.
Just disconnect the keyboard/mouse and connect a serial cable.
Another box will be needed to capture the serial console output
in case there are other problems.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
