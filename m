From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] [RFC] Reorder compat structure placement and
	casting (firmware.c)?
Date: Thu, 5 Aug 2004 22:28:30 -0400
Message-ID: <20040806022830.GB2672@baldric.uwo.ca>
References: <20040801045032.GE31520@baldric.uwo.ca>
	<20040802052751.GD20904@colo.lackof.org>
	<20040805040600.GA21912@baldric.uwo.ca>
	<20040805205937.GB20367@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040805205937.GB20367@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Aug 05, 2004 at 02:59:37PM -0600, Grant Grundler wrote:
> We don't need the same variable name. The two code paths could use different
> labels which point at the same storage. And both could co-exist in
> the wide kernel.

So you just want:


label32:
label64:
        block 8192

In the assembly and then let the C code do whatever it pleases? :)

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
