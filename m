Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 4 Feb 2003 11:06:47 -0700
To: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Yet another tar-triggered problem?
Message-ID: <20030204180647.GC15904@dsl2.external.hp.com>
References: <20030203154450.GO7503@aurinko.ntc.nokia.com> <20030203173057.GC17807@dsl2.external.hp.com> <20030204085502.GQ7503@aurinko.ntc.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030204085502.GQ7503@aurinko.ntc.nokia.com>
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

On Tue, Feb 04, 2003 at 10:55:02AM +0200, Nahkola Mikko wrote:
> 1024a2d0 seems much more readable here... but then again the stuff is 
> much further apart.
> 
> 1024a2ac t dino_in32

yeah, dino_in32 just means we detected the existing error condition
when reading from IO space. Something else caused the bus error before.


> Indeed, and on HP-UX I've seen occasional HPMCs with slightly-broken 
> disks, for example... 

Like this problem with the tape though, that's most likely a driver bug.

grant
