From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Call for Testing
Date: Tue, 29 Mar 2005 21:47:29 -0600
Message-ID: <1112154449.5784.9.camel@mulgrave>
References: <20050327204550.GC7728@roadwarrior.mcmartin.ca>
	<200503272308.32745.dmp@davidmpye.dyndns.org>
	<20050330030126.GN2485@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050330030126.GN2485@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, 2005-03-29 at 19:01 -0800, Randolph Chung wrote:
> Fixing this requires some work in binutils that nobody has been
> motivated enough to pursue yet.

Well ... not necessarily binutils.  The module is compiled with -
ffunction-sections, so it could be fixed in the in-kernel loader as
well ...  Still have to find someone motivated enough to do the work,
though.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
