From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Thu, 24 Mar 2005 14:33:44 -0700
Message-ID: <20050324213344.GC29361@colo.lackof.org>
References: <kfhwtrx2myr.fsf@csclub.uwaterloo.ca>
	<200503241619.j2OGJScZ000411@hiauly1.hia.nrc.ca>
	<20050324165947.GA29361@colo.lackof.org>
	<kfhr7i43kdx.fsf@csclub.uwaterloo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: "James A. Morrison" <ja2morri@csclub.uwaterloo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <kfhr7i43kdx.fsf@csclub.uwaterloo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Mar 24, 2005 at 02:37:46PM -0500, James A. Morrison wrote:
> > Is there a .deb or tarball available I can drop on a bunch of machines?
> 
>  Try the gcc-snapshot package.

Ah..."unstable" package:
	g/gcc-snapshot/gcc-snapshot_20050319-1.diff.gz
	g/gcc-snapshot/gcc-snapshot_20050319-1.dsc
	g/gcc-snapshot/gcc-snapshot_20050319-1_i386.deb
	g/gcc-snapshot/gcc-snapshot_20050319-1_ia64.deb
	g/gcc-snapshot/gcc-snapshot_20050319-1_mipsel.deb
	g/gcc-snapshot/gcc-snapshot_20050319-1_powerpc.deb
	g/gcc-snapshot/gcc-snapshot_20050319-1_s390.deb
	g/gcc-snapshot/gcc-snapshot_20050319.orig.tar.gz

Hrm... looks like hppa didn't build in the last one.
Most recent one available is 
	g/gcc-snapshot/gcc-snapshot_20050212-1_hppa.deb


Thinking about it more, I'd rather have Dave reccomend a tarball
he knows the test results for and is comfortable with them.

thanks though,
grant

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
