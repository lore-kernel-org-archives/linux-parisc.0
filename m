Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 14 Jan 2003 11:16:05 -0700
To: Vilmos Soti <vilmos@vilmos.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Printing problem with HP9000 712/80
Message-ID: <20030114181605.GD32537@dsl2.external.hp.com>
References: <200301100739.h0A7d5JW010596@vilmos.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200301100739.h0A7d5JW010596@vilmos.org>
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

On Thu, Jan 09, 2003 at 11:39:05PM -0800, Vilmos Soti wrote:
> So now I am in the situation that the HP computer
> doesn't talk to the HP printer but to the Panasonic one.

Vilmos,
You seem to assume the HPUX workstation division and the HP printer
division support parisc-linux. Unfortunately,that's not the case.

The parallel port HW in 712/80 is designed in early 1990s.
Is the 712/80 capable of talking to your printer?

Later parallel port standards support bidirectional data and
I'm not sure LASI chip properly supports that. Maybe someone
can clarify since I'd like to hook a Connectix Color Quickcam
to my B180. I know it works with my laptop but had problems
on the b180.

grant
