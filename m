From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] I/O MMU @ fffffffffed20000 is out of mapping
	resources: re-occured
Date: Sat, 26 Feb 2005 11:52:27 -0700
Message-ID: <20050226185227.GB16927@colo.lackof.org>
References: <420B30A200004C1D@mail-1-bnl.tiscali.it>
	<20050223220055.GD26124@colo.lackof.org>
	<42208B31.1060900@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42208B31.1060900@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Feb 26, 2005 at 02:44:01PM +0000, Joel Soete wrote:
> >Likely you have less RAM installed than I (normally 2-4 GB).
> Only 256Mb

Yeah, that's the problem. With 1/8th of that (32MB), one can easily
exhaust the IOMMU resources.

Let me think about this more. The ratio 1/8 is wrong in most cases.
I'm thinking it should be 1:1 with host mem size up to the max IOMMU
size of 1GB.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
