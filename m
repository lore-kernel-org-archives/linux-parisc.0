From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] gcc (3.3.5) causing problems in our latest kernel.
Date: Sun, 3 Apr 2005 17:43:47 -0700
Message-ID: <20050404004347.GG8921@tausq.org>
References: <1112564457.5858.7.camel@mulgrave>
	<200504032343.j33NhqX2019108@hiauly1.hia.nrc.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200504032343.j33NhqX2019108@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > static inline void __test_width(char *var, int size) {
> > 	switch (size) {	
> > 	case 1:
> > 	case 2:
> > 	case 4:
> > 	case 8:
> > 		*var++ = 0;
> > 		break;
> > 	default:
> > 		bad_function();
> > 	}
> > }
> 
> I think the optimization of switch statements is far from optimal.
> I suspect that the optimization of if statements is better.  A similar
> issue causes warning from __put_user in a 32-bit build.  Probably,
> this should be a GCC PR.

Try changing that function to
static inline void __test_width(char *var, const int size) {

willy says it worked for him :)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
