From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] Re: Runing small structs from functions.
Date: Fri, 11 Mar 2005 13:07:47 -0500
Message-ID: <20050311180747.GW22872@baldric.uwo.ca>
References: <20050311064850.GV4645@tausq.org>
	<200503111539.j2BFdcwL015273@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503111539.j2BFdcwL015273@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Mar 11, 2005 at 10:39:38AM -0500, John David Anglin wrote:
> > gcc-3.3 also returns <=8 bytes structs in ret0/ret1. there are lots of
> > gdb test cases to verify this.
> 
> Right, the ABI fix in the PA backend was made in 3.3.  I was referring
> to earlier versions.  As noted in my previous message, there still
> are issues with small structs in 3.3.  See this PR:
> <http://gcc.gnu.org/bugzilla/show_bug.cgi?id=18956>.

Since this code only *ever* returns a "struct fdesc" which is two word
sized entries aligned by the compiler, I always get "ip" in ret0 and
"gp" in ret1. So this is a very particular case of passing a small
struct by value.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
