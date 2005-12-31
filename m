From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] sym2 changes between 2.6.12 and 2.6.15
Date: Fri, 30 Dec 2005 23:56:56 -0600
Message-ID: <1136008616.3330.10.camel@mulgrave>
References: <7d01f9f00512291016k67676c59i759121abdfa0cf24@mail.gmail.com>
	<20051231031835.GB19769@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org,
 Thibaut VARENE <T-Bone@parisc-linux.org>
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051231031835.GB19769@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, 2005-12-30 at 20:18 -0700, Matthew Wilcox wrote:
> > <jejb> OK, it's picking up narrow as an nvram setting
> > <jejb> that's a new feature of the driver (believing the nvram)
> > <jejb> there's probably some secret PDC call we should be doing instead
> 
> But we already are -- see sym_read_parisc_pdc() and sym_nvram_setup_host().
> 
> Could you dump the contents of nvram->data.parisc ?
> 
> I have a feeling we're not doing something right though, because we
> should only be setting width on a 9000/785 (ie C3000-family).
> 
> Debugging needed, please!

Debugging only needed if you can tell me how nvram->data.parisc gets
plugged into tp->usr_period and tp->usr_width which you use to set up
the max values in slave configure.  These seem to be uninitialised for
the PDC methods (only for the NVRAM or TEKRAM).

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
