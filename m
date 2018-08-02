From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: prefer _THIS_IP_ and _RET_IP_ statement
 expressions
Date: Wed, 1 Aug 2018 20:49:50 -0400
Message-ID: <536ef1b1-cfa2-f66d-4261-fb8405964632@bell.net>
References: <20180801182258.17834-1-ndesaulniers@google.com>
 <78c667f9-5c8b-3835-83eb-4b59e27e4f7e@bell.net>
 <CAKwvOdmdrA+UvAWyqe8sNJt5nxHXHsSwf5Yxih9HYgVL+kovxQ@mail.gmail.com>
 <fe7b57d8-b586-a390-31d2-2274f69db3c0@bell.net>
 <CAKwvOd=CLBFZRQ4HQb_+VCydDEvsbC2w2gD4hTwvp_jm1zqN9Q@mail.gmail.com>
 <54b2139b-53d2-01c5-f240-93a692cdbc59@bell.net>
 <CAKwvOdktvrZL8T_5K2VtQtgt_mscS7kzVXYVy0O7CSuGX53Y5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: deller@gmx.de, jejb@parisc-linux.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        pravin.shedge4linux@gmail.com,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-parisc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKwvOdktvrZL8T_5K2VtQtgt_mscS7kzVXYVy0O7CSuGX53Y5A@mail.gmail.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2018-08-01 6:18 PM, Nick Desaulniers wrote:
>> What about the uses in the fs support, etc?
> Sorry, I don't see it?
I mean _THIS_IP_.

Dave

-- 
John David Anglin  dave.anglin@bell.net
