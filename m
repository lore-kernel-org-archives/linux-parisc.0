From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] ASSERT() -> BUG_ON() (2/4):
	drivers/parisc/sba_iommu.c
Date: Mon, 8 Nov 2004 00:05:02 +0000
Message-ID: <20041108000502.GN24690@parcelfarce.linux.theplanet.co.uk>
References: <418E1ED4.8070104@tiscali.be>
	<20041107213942.GA16345@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041107213942.GA16345@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Nov 07, 2004 at 02:39:42PM -0700, Grant Grundler wrote:
> I'm rejecting this patch because of this.
> I write (0 == foo) to avoid "foo = 0" mistakes.

GCC warns about this.

$ gcc -Wall test.c
test.c: In function `main':
test.c:3: warning: suggest parentheses around assignment used as truth value
$ cat test.c
int main(int argc, char **argv)
{
        if (argc = 1)
                return 1;
        return 0;
}

So I think this is an invalid objection.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
