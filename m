From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Heavy Iron Reference Docs
Date: Tue, 2 May 2006 11:13:45 -0400
Message-ID: <20060502151345.GD6958@skunkworks.cabal.ca>
References: <20060502060028.GA14414@colo.lackof.org>
	<200605021510.k42FAps6000117@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200605021510.k42FAps6000117@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, May 02, 2006 at 11:10:51AM -0400, John David Anglin wrote:
> Are there any PA 2.0 machines for which the value of coherent_system
> is 0?  If so, which ones?
>

I'll cook a patch which dumps more cache info.

struct pdc_cache_cf {           /* for PDC_CACHE  (I/D-caches) */
	[...]
                cc_cst  : 3,    /* 0 = incoherent D-cache, 1=coherent D-cache */
	[...]
};

Should tell us what we need to know. 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
