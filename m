From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Re: [RFC][PATCH] use cycle_t instead of u64 in
	struct time_interpolator
Date: Wed, 3 Jan 2007 19:36:36 +0100
Message-ID: <200701031936.36423.deller__11880.270104348$1416624250$gmane$org@gmx.de>
References: <200701022233.25697.deller@gmx.de>
	<Pine.LNX.4.64.0701030942160.7909@schroedinger.engr.sgi.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: linux-kernel@vger.kernel.org,
 parisc-linux@lists.parisc-linux.org
To: Christoph Lameter <clameter@sgi.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.64.0701030942160.7909@schroedinger.engr.sgi.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed Jan 3 2007, Christoph Lameter wrote:
> On Tue, 2 Jan 2007, Helge Deller wrote:
> 
> > As far as I could see, this patch does not change anything for the 
> > existing architectures which use this framework (IA64 and SPARC64), 
> > since "cycles_t" is defined there as unsigned 64bit-integer anyway 
> > (which then makes this patch a no-change for them).
> 
> The 64bit nature of some entities was so far necessary to get the 
> proper accuracy of interpolation. Maybe it can be made to work with 32 bit 
> entities. The macro GET_TI_SECS must work correctly and the less bits are 
> specified in shift the less self-tuning accuracy you will get.

Yes, it was easily possible to make it 32bit-ready without loosing the accuracy.

Nevertheless, in the meantime John Stultz pointed me to the CONFIG_GENERIC_TIME framework,  and I implemented it that way:
http://git.parisc-linux.org/?p=linux-2.6.git;a=commit;h=b6de83b58b8b07f057deacdef8a95b6c32d1c4e6
http://git.parisc-linux.org/?p=linux-2.6.git;a=commit;h=f70a979c843e4610edfb2a316648fe8ae8718f69

Thus please ignore my original patch proposal. It's not needed any more...

Thanks,
Helge

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
