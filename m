From: Michel Lespinasse <walken@google.com>
Subject: Re: possible virtual aliasing issues on parisc ?
Date: Fri, 2 Nov 2012 04:23:56 -0700
Message-ID: <CANN689HkvYch9JAmo+h44Qq+fMvi0ugc01nsxLnMvkrTcnF37A@mail.gmail.com>
References: <CANN689E4p3woSkdLavyyPA2gZUmVvOAW4w0R6fo9exRPQDa=JA@mail.gmail.com>
	<1351848864.2439.18.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1351848864.2439.18.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Nov 2, 2012 at 2:34 AM, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> [cc to parisc list]
>
> On Thu, 2012-11-01 at 16:45 -0700, Michel Lespinasse wrote:
>> Hi,
>>
>> I am currently working on a patchset to avoid the brute-force search
>> in arch_get_unmapped_area functions (and also pushes some of it back
>> into generic code). So far I've only sent it as an RFC on linux-mm.
>
> Actually, I read linux-mm pretty closely (at least for the cgroups
> stuff), but I must have missed it.

Oh, I've actually only sent out the generic and x86_64 parts so far,
as I was looking for comments on the general design first. I'm going
through the architectures but haven't tried sending that out yet :)

>  In general, if you need the
> attention of arch maintainers, linux-arch is the right list to cc.

Oh nice, I didn't know about that particular list.

-- 
Michel "Walken" Lespinasse
A program is never fully debugged until the last user dies.
