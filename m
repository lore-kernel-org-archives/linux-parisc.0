From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: Please include the namespace file-descriptors tree in linux-next
Date: Tue, 10 May 2011 20:04:17 -0700
Message-ID: <m1sjsmdjke.fsf@fess.ebiederm.org>
References: <m1sjsmp44c.fsf@fess.ebiederm.org>
	<20110511102736.7a9dc881.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "David S. Miller" <davem@davemloft.net>,
	linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	James Bottomley <James.Bottomley@suse.de>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110511102736.7a9dc881.sfr@canb.auug.org.au> (Stephen
	Rothwell's message of "Wed, 11 May 2011 10:27:36 +1000")
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> On Tue, 10 May 2011 15:44:51 -0700 ebiederm@xmission.com (Eric W. Biederman) wrote:
>>
>> These changes have just been through review and I expect
>> to send Linus a pull request when the merge window opens.
>> 
>> This tree holds changes that significantly simply the userspace
>> interface to working with namespaces.
>> 
>> I had to pull some of net-next and the parisc tress to be able to
>> avoid conflicts with system call numbers.  Hopefully that is not
>> a problem.
>
> That should be fine as Dave's tree never rebases and the parisc tree
> looks pretty stable.  Just keep an eye on those trees, just in case.

Good point.  I have talked to James and Dave so they know I pulled their
trees.  My lazy side says I expect you will get a merge conflict with my
tree in linux-next if someone rebases.  But I will definitely keep my
eyes out and at the very least double check that all is well before I
send Linus a pull request.  

Eric
