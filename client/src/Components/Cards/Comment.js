import React, { useState, useContext } from 'react'
import EachComment from './EachComment'
import { UserContext } from '../../App'

function Comment({ props, myProfPic }) {
  const [newCommentText, setNewCommentText] = useState("")
  const [newComment, setNewComment] = useState(null)

  const user = useContext(UserContext)
  console.log(user)
  function handleSubmit(e) {
    e.preventDefault()

    const commentableType = props.github ? "Project" : "Post"
    const commentObj = {
        text: newCommentText,
        commentable_type: commentableType,
        commentable_id: props.id,
        user_id: user.id
    }

    fetch('/comments', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(commentObj)
    })
    .then(r => r.json())
    .then(commentToAppendToRender => setNewComment(commentToAppendToRender))
    setNewCommentText('')
  }

  let commentsAfterPost;
  if (newComment != null) {
      commentsAfterPost = [...props.comments, newComment]
  } else {
      commentsAfterPost = props.comments
  }

  const renderComments = commentsAfterPost?.map(comment => (
    <EachComment 
      className='comment-box'
      key={comment.id}
      id={comment.id} 
      text={comment.text} 
      user_id={comment.user_id} 
      name={comment.name}
    />
  ))


  return (
    <div className='comment-container'>
      
          <div className="new-comment-container">
            <img src={myProfPic} alt='prof-pic' className='card-pic'/>
            <div className="new-comment">
              <form onSubmit={(e) => handleSubmit(e)}>
                <input type='text' value={newCommentText} onChange={(e) => setNewCommentText(e.target.value)} placeholder='Leave a comment!' className='field3'/>
                {newCommentText === "" ? null : <input type='submit' id='submit' className='comment-submit' />}
              </form>
            </div>
          </div>
    
      {renderComments}
    </div>
  )
}

export default Comment