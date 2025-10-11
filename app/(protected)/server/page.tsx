import { UserInfo } from '@/components/user-info'
import React from 'react'
import { userInfo } from '@/actions/user-info'

const Server = async () => {
    const user = await userInfo()

  return (
    <UserInfo label='💻 Server Component' user={user} />
  )
}

export default Server