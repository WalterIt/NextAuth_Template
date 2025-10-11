
import UserSettings from '@/components/user-settings'
import { auth } from '@/auth'

const SettingPage = async () => {
  const session = await auth()

  const user = session?.user

  const content = (<UserSettings user={user!} />)


  return (
    <>
    {content}    
    </>
    
  )
}

export default SettingPage